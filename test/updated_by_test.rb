require 'test_helper'

class UpdatedByTest < ActiveSupport::TestCase
  test "should include updated_by in classes that inherits ActiveRecord::Base" do
    assert ActiveRecord::Base.respond_to?(:updated_by)
  end
end
