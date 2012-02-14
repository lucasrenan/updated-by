require 'test_helper'

class UpdatedBy::Adapters::ActiveRecordTest < ActiveSupport::TestCase
  
  setup do
    @post = Post.new(:title => "post title")
    @user = User.create(:name => "user_create")
  end
  
  test "should return user that created" do
    set_current_user(@user)
    @post.save
    
    assert_equal @post.created_by, @user
  end
  
  test "should return user that updated" do
    set_current_user(@user)
    @post.save
    
    user = User.create(:name => "user_update")
    set_current_user(user)
    @post.save
    
    assert_equal @post.updated_by, user
  end
  
  test "should return nil if no user is setted" do
    p = Post.create(:title => "no user")
    
    assert_nil p.created_by
  end

end