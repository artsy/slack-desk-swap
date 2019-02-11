require 'date'

namespace :desk_swap do
  desc 'Start new round for today'
  task :start_today_round => :environment do
    RoundService.start_new_round(Date.today)
  end
end
