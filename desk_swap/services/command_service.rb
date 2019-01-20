module CommandService
  def self.join(user_id, team_id, &block)
    team = Team.find(team_id)
    team.users.find_or_create_by!(user_id: user_id, &block)
  end

  def self.set_location(user_id, team_id, location)
    team = Team.find(team_id)
    user = team.users.find_by!(user_id: user_id)
    user.update!(location: location)
    user
  end
end
