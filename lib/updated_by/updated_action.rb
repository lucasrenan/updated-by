class UpdatedAction < ::ActiveRecord::Base
  belongs_to :updated, :polymorphic => true

  # def created_by
  #   user(read_attribute(:created_by))
  # end
  # 
  # def updated_by
  #   user(read_attribute(:updated_by))
  # end
  # 
  # private
  # def user(user_id)
  #   User.where(:id => user_id).first
  # end
end