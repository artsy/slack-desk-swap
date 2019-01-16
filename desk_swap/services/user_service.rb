module UserService
  def self.join(user_id, user_name, team_id)
    team = Team.find_or_create_by!(team_id: team_id)
    team.users.find_or_create_by!(user_id: user_id, user_name: user_name)
  end
end