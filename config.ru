ENV['RACK_ENV'] ||= 'development'

Bundler.require :default

require_relative 'commands'
require 'yaml'
require 'erb'

ActiveRecord::Base.establish_connection(
  YAML.load(
    ERB.new(
      File.read('config/postgresql.yml')
    ).result
  )[ENV['RACK_ENV']]
)

NewRelic::Agent.manual_start

SlackRubyBotServer::App.instance.prepare!
SlackRubyBotServer::Service.start!

run SlackRubyBotServer::Api::Middleware.instance
