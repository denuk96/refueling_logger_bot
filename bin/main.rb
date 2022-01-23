require_relative '../lib/app_configurator'
require_relative '../lib/bot/api_client'

AppConfigurator.setup_database
Bot::ApiClient.start(ENV['TELEGRAM_BOT_TOKEN'])
