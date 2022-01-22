module Bot
  class ApiClient
    class << self
      def start(token = ENV['TELEGRAM_BOT_TOKEN'])
        Telegram::Bot::Client.run(token) do |bot|
          bot.listen do |msg|
            p msg

            # Bot::TelegramResponder.new(bot: bot, message: msg, user: user).respond
          end
        end
      end
    end
  end
end
