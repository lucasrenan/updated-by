class UpdatedAction < ::ActiveRecord::Base
  belongs_to :updated, :polymorphic => true
end