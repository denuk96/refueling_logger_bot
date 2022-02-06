module Bot
  module Buttons
    class LogRefueling < Base
      def execute(user)
        p 'AWAITING FOR USER REFUELING DATA'
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          'Log Refueling',
          callback_data: 'log_refueling'
        )
      end

      def response_message
        Bot::Settings::BUTTONS_RESPONSE_MESSAGES[:log_refueling]
      end
    end
  end
end
