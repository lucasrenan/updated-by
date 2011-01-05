require 'test_helper'

class UpdatedBy::Adapters::ActiveRecordTest < ActiveSupport::TestCase
  
  setup do
    @post = Post.new(:title => "post title")
    @user = User.create(:name => "user_create")
    User.current_user = @user
    @post.save
  end
  
  test "should return user that created" do
    assert_equal @post.created_by, @user
  end
  
  test "should return user that updated" do
    user = User.create(:name => "user_update")
    User.current_user = user
    @post.save
    
    assert_equal @post.updated_by, user
  end
end