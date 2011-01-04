module UpdatedBy
  module Updated
    def self.included(base)
      base.extend(ClassMethods)
    end

    module ClassMethods
      def updated_by(options={})
        
        class_eval do
          before_save :created_or_updated_by
        end

        if self.superclass == ActiveRecord::Base
          include UpdatedBy::Adapters::ActiveRecord
          
        end

      end
    end

    module InstanceMethods
    end
  end
end