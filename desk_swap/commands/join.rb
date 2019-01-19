class Join < SlackRubyBot::Commands::Base
  def self.call(client, data, _match)
    CommandService.join(data.user.id, data.user.name, client.id)
    client.say(channel: data.channel, text: "<@#{data.user}>")
    logger.info "UNAME: #{client.owner}, user=#{data.user}"
  end
end
