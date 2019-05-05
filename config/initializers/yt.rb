Yt.configure do |config|
  config.api_key = Rails.application.credentials.yt_secret_token
end
