module CommandService
  AVAILABLE_COMMANDS = [
    JOIN = 'join',
    LEAVE = 'leave'
  ]
  def self.process(text, user_id, user_name, team_id)
    case text.split.first
      JOIN then join(user_id, user_name, team_id)
    else
      "Unknown command!"
    end
  end

  def self.join(user_id, user_name, team_id)
    team = Team.find_or_create!(team_id: team_id)
    team.users.find_or_create!(user_id: user_id, user_name: user_name)
  end
end
