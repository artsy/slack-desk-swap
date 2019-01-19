class Help < SlackRubyBot::Commands::Base
  HELP = <<-EOS.freeze
```
I'm your friendly desk swap 🤖, here to help.

Avaialable Commands
-------

help               - get this helpful message
join               - join desk swap fun :tada:
unjoin             - opt out of desk swap fun :sad-parrot:
setup              - update your current desk setup (monitor, standing desk and etc.)
location           - update your desk's location
```
  EOS
  def self.call(client, data, _match)
    client.say(channel: data.channel, text: HELP)
    client.say(channel: data.channel, gif: 'help')
    logger.info "HELP: #{client.owner}, user=#{data.user}"
  end
end
