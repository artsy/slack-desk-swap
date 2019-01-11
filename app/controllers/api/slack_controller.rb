class Api::SlackController < ApplicationController
  def command
    render json: { response_type: "in_channel", text: "Hello There" }
  end
end
