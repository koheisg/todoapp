if Rails.env.production?
  Rails.application.config.session_store :redis_store, {servers: ENV['REDIS_URL'], expire_after: 1.week}
else
  Rails.application.config.session_store :cookie_store
end
