Slack.configure do |config|
  config.token = Rails.application.config_for(:slack)['api_token']
end