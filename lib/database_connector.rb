require 'active_record'
require 'logger'

class DatabaseConnector
  class << self
    def establish_connection
      ActiveRecord::Base.logger = Logger.new(STDOUT, Logger::DEBUG)
      ActiveRecord::Base.establish_connection(database_config)
    end

    def database_config
      configuration = YAML::load(IO.read('config/database.yml'))
      secrets = {
        'database' => ENV['DATABASE_NAME'],
        'username' => ENV['DATABASE_USER'],
        'password' => ENV['DATABASE_PASSWORD'],
        'host' => ENV['DATABASE_HOST'],
      }
      configuration.merge(secrets)
    end
  end
end