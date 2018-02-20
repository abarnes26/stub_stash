Rails.application.config.middleware.use OmniAuth::Builder do
  provider :spotify, ENV['SPOTIFY_CLIENT_KEY'], scope: 'user-follow-read user-read-email'
end
