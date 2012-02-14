require "updated_by/updated_action"

module UpdatedBy
  module Adapters
    
    module ActiveRecord
      def self.included(base)
        base.class_eval do
          has_one :updated_action, :as => :updated,  :dependent => :destroy
        end
      end
      
      def created_or_updated_by
        user = User.current_user
        
        unless user.nil?
          u = UpdatedAction.find_or_create_by_updated_id_and_updated_type(self.id, self.class.to_s.camelize)

          if self.new_record?
            u.created_by = user.id
          else
            u.updated_by = user.id
          end

          self.updated_action = u
        end
      end 
      
      def created_by
        find_user(self.updated_action.read_attribute(:created_by)) if self.updated_action
      end

      def updated_by
        find_user(self.updated_action.read_attribute(:updated_by)) if self.updated_action
      end

      private
      def find_user(user_id)
        User.where(:id => user_id).first
      end
      
    end
    
  end
end