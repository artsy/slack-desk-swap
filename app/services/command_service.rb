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
    attachments = []
    attachments << Slack::Attachment.new(title: 'Tell us where you seat', text: 'by /slack-desk-swap location <you location description>') unless user.location?
    attachments << Slack::Attachment.new(title: 'Tell us about your setup', text: 'by /slack-desk-swap setup <your desk setup>') unless user.setup?
    Slack::Response.new(text: "Awesome! You are setup for desk-sawp! Wait for our message to setup your first 🖥 🔄", attachments: attachments)
  end
end
