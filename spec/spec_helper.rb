$LOAD_PATH.unshift File.expand_path('..', __dir__)

ENV['RACK_ENV'] = 'test'

require 'active_record'
require 'database_cleaner'
require 'slack-ruby-bot-server/rspec'

db_config = YAML.safe_load(ERB.new(File.read('config/postgresql.yml')).result, [], [], true)[ENV['RACK_ENV']]
ActiveRecord::Tasks::DatabaseTasks.create(db_config)
ActiveRecord::Base.establish_connection(db_config)

RSpec.configure do |config|
  config.around :each do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
