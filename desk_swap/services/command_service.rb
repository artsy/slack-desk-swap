module CommandService
  def self.join(user_id, team_id, &block)
    team = Team.find_by(team_id: team_id)
    team.users.find_or_create_by!(user_id: user_id, &block)
  end
end
