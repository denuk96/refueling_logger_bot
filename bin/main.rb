require_relative '../lib/app_configurator'
require_relative '../lib/bot/client'

AppConfigurator.setup_database
p User.last
# Bot::Client.start
