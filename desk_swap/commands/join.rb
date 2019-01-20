class Join < SlackRubyBot::Commands::Base
  def self.call(client, data, _match)
    logger.info "Join: #{client.owner.class}, user=#{data.user}"
    text = "Awesome! you are now setup with desk swap"
    user = CommandService.join(data.user, client.owner.id) do |user|
      # new user
      text = 'Welcome to desk swap!'
    end
    client.say(channel: data.channel, text: text)
    client.say(channel: data.channel, text: 'Please set your location with @deskswap location <your location>') if user.location.nil?
    client.say(channel: data.channel, text: 'Please tell us about your setup, things like monitor, standing desk and etc. @deskswap setup <your location>') if user.setup.nil?
  end
end
