module RoundService

  ROUND_AVAILABILITY_MESSAGE = {
    text: "Hi,\n When had a chance please select the days you are available for possible desk swap next week",
    attachments: [
      {
        text: '',
        attachment_type: 'default',
        actions: 7.times.map do |d|
          {
            name: 'choice',
            text: Date.today + d.days
            type: 'button',
            value: Date.today + d.days,
            style: 'primary'
          }
        end
      }
  }
  def self.start_round(team_id)
    client = Slack::Web::Client.new
    team = Team.find(team_id)
    team.rounds.find_or_create_by!(start_date: Date.today) do |created_round|
      # ask each user about their prefrences for this round
      team.users.has_location.each do |u|
        client.chat_postMessage(ROUND_AVAILABILITY_MESSAGE.merge(channel: u.user_id, as_user: true))
      end
    end
  end
end
