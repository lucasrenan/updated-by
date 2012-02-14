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
        warn "not implemented yet"
        # if self.new_record?
        #   puts "vai criarrrrrrrrrr"
        # else
        #   puts "vai atualizarrrrrrrrrrrr"
        # end
      end 
      
    end
    
  end
end