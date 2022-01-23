require "bundler/setup"
Bundler.require
Dotenv.load('./.env')
require './lib/database_connector'
require './models/user'
require_relative 'basic/hash'

module AppConfigurator
  class << self
    def setup_database
      DatabaseConnector.establish_connection
    end

    def logger
      @logger ||= Logger.new(STDOUT, Logger::DEBUG)
    end
  end
end