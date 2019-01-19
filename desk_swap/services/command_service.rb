module CommandService
  def self.join(user_id, user_name, team_id)
    team = Team.find_by(team_id: team_id)
    user = team.users.find_or_create_by!(user_id: user_id, user_name: user_name)
  end
end
