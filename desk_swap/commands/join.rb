class Join < SlackRubyBot::Commands::Base
  def self.call(client, data, _match)
    user = CommandService.join(data.user, client.owner.id) do |user|
      # new user
      client.say(channel: data.channel, text: 'Welcome to desk swap!')
      client.say(channel: data.channel, text: 'Please set your location and tell us about your current setup!')
    end
    logger.info "UNAME: #{client.owner}, user=#{data.user}"
  end
end
