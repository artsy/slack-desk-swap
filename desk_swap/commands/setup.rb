class Setup < SlackRubyBot::Commands::Base
  def self.call(client, data, match)
    logger.info "Setup: #{client.owner.class}, user=#{data.user}, match=#{match[:expression]}"
    if match[:expression].empty? || match[:expression].casecmp?('help')
      client.say(channel: data.channel, text: "Tell us about your setup, things like your monitor, if you have standing desk and etc.")
    else
      user = CommandService.set_setup(data.user, client.owner.id, match[:expression])
      client.say(channel: data.channel, text: "Thanks! we've now set your setup to 🤓 🖥 #{user.setup}")
    end
  end
end
