require 'test_helper'

class UserTest < ActiveSupport::TestCase
  before do
    @user = User.new
  end

  describe "username validations" do
    it "must be present" do
      @user.wont_be :valid?
      @user.errors.first.must_equal [:username, "can't be blank"]
    end
  end
end
