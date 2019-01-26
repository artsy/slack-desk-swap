$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV['RACK_ENV'] ||= 'development'

require 'bundler/setup'
Bundler.require :default, ENV['RACK_ENV']

require 'slack-ruby-bot-server'
require 'desk_swap'

NewRelic::Agent.manual_start



Thread.new do
  SlackRubyBotServer::App.instance.prepare!
  SlackRubyBotServer::Service.start!
end

#run SlackRubyBotServer::Api::Middleware.instance

run Api::Middleware.instance