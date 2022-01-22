require "bundler/setup"
Bundler.require
Dotenv.load('./.env')
require './lib/database_connector'
require './models/user'

module AppConfigurator
  class << self
    def setup_database
      DatabaseConnector.establish_connection
    end
  end
end