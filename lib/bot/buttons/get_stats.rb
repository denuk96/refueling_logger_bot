module Bot
  module Buttons
    class GetStats < Base
      def execute
        'GetStats executing'
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          "STATS",
          callback_data: "get_stats"
        )
      end

      def response_message
        Bot::Settings::BUTTONS_RESPONSE_MESSAGES[:get_stats]
      end
    end
  end
end
