require_relative '../../stats_calculator'

module Bot
  module Buttons
    class GetStats < Base
      attr_reader :response_message

      def execute(user)
        @response_message = StatsCalculator.new(user).call
      end

      def markup
        Telegram::Bot::Types::InlineKeyboardButton.new(
          text:          'STATS',
          callback_data: 'get_stats'
        )
      end
    end
  end
end
