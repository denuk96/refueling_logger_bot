module Bot
  module ReplyHandlers
    class HandlerRunner
      attr_reader :replied_msg, :reply_msg, :user

      def initialize(replied_msg:, reply_msg:, user:)
        @replied_msg = replied_msg
        @reply_msg   = reply_msg
        @user        = user
      end

      def call
        handler_key   = Bot::Settings::BUTTONS_RESPONSE_MESSAGES.key(replied_msg.text)

        return unless handler_key

        handler_class = Bot::Settings::REPLY_HANDLERS[handler_key]

        handler_class.new.call(user: user, reply_msg: reply_msg)
      end
    end
  end
end