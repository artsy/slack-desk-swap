ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
require 'active_record'
Bundler.require :default, ENV['RACK_ENV']

require 'yaml'
require 'erb'

Dir[File.expand_path('config/initializers', __dir__) + '/**/*.rb'].each do |file|
  require file
end

ActiveRecord::Base.establish_connection(
  YAML.load(
    ERB.new(
      File.read('config/postgresql.yml')
    ).result
  )[ENV['RACK_ENV']]
)

require 'slack-ruby-bot'
require 'desk_swap/models'
require 'desk_swap/services'
require 'desk_swap/commands'