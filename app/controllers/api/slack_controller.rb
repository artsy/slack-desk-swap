class Api::SlackController < ApplicationController
  before_action :validate_slack_token

  def command
    response = CommandService.process(params.slice(:text, :user_id, :user_name, :team_id))
    render json: { response_type: "in_channel", text: response }
  end

  private

  def validate_slack_token
    head(:forbidden) unless params[:token] == Application.config_for(:slack, slash_command_token)
  end

  def command_params
    params.permit(:text, :token, :user_id, :team_id, :team_domain, :user_name)
  end
end
