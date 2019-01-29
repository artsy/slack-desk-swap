module RoundService

  ROUND_AVAILABILITY_MESSAGE = {
    text: "Hi,\n When had a chance please select the days you are available for possible desk swap next week",
    attachments: [
      {
        text: '',
        attachment_type: 'default',
        actions: 7.times.map do |d|
          {
            name: 'round_choice',
            text: (Date.today + d.days).strftime("%a, %b %e"),
            type: 'button',
            value: (Date.today + d.days).iso8601,
            style: 'default'
          }
        end
      }
    ]
  }

  def self.start_round(team_id)
    team = Team.find(team_id)
    return if team.rounds.exists?(start_date: Date.today)
    round = team.rounds.create!(start_date: Date.today)
    # ask each user about their preferences for this round
    team.users.has_location.each do |u|
      im = team.slack_client.im_open(user: u.user_id)
      ask_preference = ROUND_AVAILABILITY_MESSAGE.merge(channel: im['channel']['id'], as_user: true)
      ask_preference[:attachments].first[:callback_id] = round.id.to_s
      team.slack_client.chat_postMessage(ask_preference)
    end
  end

  def self.match_for_round(date)
    Team.all.each do |t|
      current_round = team.rounds.order_by(start_date: :desc).&first
      return unless current_round
      eligible_user_perfs = current_round.user_preferences.where("preferences -> 'available_dates' ? :avialable_date", avialable_date: date).order_by('json_array_length(?)', "preferences -> 'available_dates'")
    end
  end
end
