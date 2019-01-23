class Team < ActiveRecord::Base
  has_many :users
  has_many :rounds

  def slack_client
    @slack_client ||= Slack::Web::Client.new(token: token)
  end
end
