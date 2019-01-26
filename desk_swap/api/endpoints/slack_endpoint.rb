module Api
  module Endpoints
    class SlackEndpoint < Grape::API
      format :json

      namespace :slack do
        desc 'Respond to interactive slack buttons and actions.'

        params do
          requires :payload, type: String
        end

        post '/action' do
          payload = JSON.parse(params[:payload], object_class: OpenStruct)
          error! 'Message token is not coming from Slack.', 401 if ENV.key?('SLACK_VERIFICATION_TOKEN') && payload.token != ENV['SLACK_VERIFICATION_TOKEN']
          error! 'Missing actions.', 400 unless payload.actions
          error! 'Missing action.', 400 unless payload.actions.first

          case payload.actions.first.name
          when 'round_choice' then
            round = Round.find(payload.callback_id) || error!('Round Not Found', 404)
            preference = payload.actions.first.value
            user = payload.user.id
            rup = round.round_user_preference.find_or_create_by(user: user)
            rup.update!(preferences: rup.preferences + preference)

            Api::Middleware.logger.info "Updated user #{user}, preference for round #{round} to '#{rup.preferences}'."

            message = payload.original_message

            message[:attachments].first[:actions].each do |action|
              action[:style] = rup.preferences.include?(action[:value]) ? 'primary' : 'default'
            end

            message[:text] = 'Thanks for letting me know! you are currently setup for following days.'

            {
              as_user: true,
              channel: payload.channel.id,
              ts: payload.original_message.ts,
              token: payload.token
            }.merge(message)

          else
            error!("Unknown Action #{payload.actions.first.name}", 400)
          end
        end
      end
    end
  end
end
