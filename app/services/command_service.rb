module CommandService
  AVAILABLE_COMMANDS = [
    JOIN = 'join',
    LEAVE = 'leave'
  ]
  def self.process(text, user_id, user_name, team_id)
    case text.split&.first
    when JOIN then join(user_id, user_name, team_id)
    else
      "Unknown command!"
    end
  end

  def self.join(user_id, user_name, team_id)
    team = Team.find_or_create_by!(team_id: team_id)
    user = team.users.find_or_create_by!(user_id: user_id, user_name: user_name)
    "Awesome! You are setup for desk-sawp! wait for our message to setup your first 🖥 🔄"
  end
end
