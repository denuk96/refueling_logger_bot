module Bot
  module Buttons
    class Base < Abstract
      def force_reply
        Telegram::Bot::Types::ForceReply.new(
          force_reply: true,
          selective:   true
        )
      end
    end
  end
end