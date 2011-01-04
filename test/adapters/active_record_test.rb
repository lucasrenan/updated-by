require 'test_helper'

class UpdatedBy::Adapters::ActiveRecordTest < ActiveSupport::TestCase
  test "provisorio" do
    p = Post.new
    p.title = "uahuahua"
    p.updated_action = UpdatedAction.new
    p.save
    
    assert_equal UpdatedAction.last.updated.id, p.id
  end
end