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
          payload = Hashie::Mash.new(JSON.parse(params[:payload]))
          error! 'Message token is not coming from Slack.', 401 if ENV.key?('SLACK_VERIFICATION_TOKEN') && payload.token != ENV['SLACK_VERIFICATION_TOKEN']
          error! 'Missing actions.', 400 unless payload.actions
          error! 'Missing action.', 400 unless payload.actions.first

          case payload.actions.first.name
          when 'round_choice' then
            round = Round.find(payload.callback_id) || error!('Round Not Found', 404)
            avilable_date = payload.actions.first.value
            slack_user_id = payload.user.id
            user = User.find_by(user_id: slack_user_id)
            rup = round.user_preferences.find_or_create_by!(user: user)
            rup.update!(available_dates: ((rup.available_dates || []) + [avilable_date]).uniq)

            Api::Middleware.logger.info "Updated user #{user}, preference for round #{round} to '#{rup.preferences}'."

            message = payload.original_message.dup

            message[:attachments].first[:actions].each do |action|
              action[:style] = rup.available_dates.include?(action[:value].to_s) ? 'primary' : 'default'
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
