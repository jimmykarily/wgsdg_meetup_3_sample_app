require 'test_helper'

class UserTest < ActiveSupport::TestCase
  before do
    @user = User.new
    App::Application.redis.del "visits"
  end

  describe "username validations" do
    it "must be present" do
      @user.wont_be :valid?
      @user.errors.first.must_equal [:username, "can't be blank"]
    end
  end

  describe "bump_visits" do
    it "increments the visits" do
      @user.visits.must_equal 0
      @user.bump_visits
      @user.visits.must_equal 1
      @user.bump_visits
      @user.visits.must_equal 2
    end
  end
end
