require_relative 'telegram_responder'

module Bot
  class ApiClient
    class << self
      def start(token)
        AppConfigurator.logger.debug 'Starting telegram bot'

        Telegram::Bot::Client.run(token) do |bot|
          bot.listen do |msg|
            user = authenticate!(msg.from.id)
            log(msg, user)
            Bot::TelegramResponder.new(bot: bot, message: msg, user: user).respond
          end
        end
      rescue StandardError => e
        AppConfigurator.logger.error e.message
      end

      private

      def authenticate!(user_id)
        User.find_or_create_by!(uid: user_id)
      end

      def log(msg, user)
        if msg.respond_to?(:text)
          AppConfigurator.logger.debug "@#{msg.from.username}-#{user.id}: #{msg.text}"
        else
          AppConfigurator.logger.debug "@#{msg.from.username}-#{user.id}: #{msg.message.text}"
        end
      end
    end
  end
end
