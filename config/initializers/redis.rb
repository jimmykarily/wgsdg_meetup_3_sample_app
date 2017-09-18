redis_db_index = {
  "production" => 0,
  "development" => 1,
  "test" => 2,
}

App::Application.redis =
  if ENV["REDIS_URL"]
    Redis.new(url: ENV["REDIS_URL"], db: redis_db_index[Rails.env.to_s])
  else
    Redis.new(db: redis_db_index[Rails.env.to_s])
  end
