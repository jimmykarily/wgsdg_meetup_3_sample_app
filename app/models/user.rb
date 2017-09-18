class User < ActiveRecord::Base
  validates :username, presence: true

  attr_accessor :redis

  def bump_visits
    redis.incr "visits"
  end

  def visits
    redis.get("visits").to_i
  end

  private

  def redis
    App::Application.redis
  end
end
