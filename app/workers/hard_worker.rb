class HardWorker
  include Sidekiq::Worker

  def perform
    sleep 2
    App::Application.redis.incr "jobs"
  end
end
