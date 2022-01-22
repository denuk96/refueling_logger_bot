require 'rubygems'
require 'bundler/setup'

require 'pg'
require 'active_record'
require 'yaml'

require_relative 'config/database_connector'

namespace :db do

  desc 'Migrate the database'
  task :migrate do
    connection_details = DatabaseConnector.database_config
    ActiveRecord::Base.establish_connection(connection_details)
    ActiveRecord::Migration.migrate('db/migrate/')
  end

  desc 'Create the database'
  task :create do
    connection_details = DatabaseConnector.database_config
    admin_connection = connection_details.merge('database' => 'postgres',
                                                'schema_search_path' => 'public')
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.create_database(connection_details.fetch('database'))
  end

  desc 'Drop the database'
  task :drop do
    connection_details = DatabaseConnector.database_config
    admin_connection = connection_details.merge('database' => 'postgres',
                                                'schema_search_path' => 'public')
    ActiveRecord::Base.establish_connection(admin_connection)
    ActiveRecord::Base.connection.drop_database(connection_details.fetch('database'))
  end
end
