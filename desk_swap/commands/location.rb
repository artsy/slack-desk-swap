class Location < SlackRubyBot::Commands::Base
  def self.call(client, data, match)
    logger.info "Location: #{client.owner.class}, user=#{data.user}, match=#{match[:expression]}"
    user = CommandService.set_location(data.user, client.owner.id, match[:expression])
    client.say(channel: data.channel, text: "Thanks! we've now set your location to #{user.location}")
  end
end
