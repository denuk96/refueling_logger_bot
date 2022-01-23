require_relative "settings"
require_relative "buttons/buttons_composer.rb"
require_relative "reply_handlers/handler_runner"


module Bot
  class TelegramResponder
    attr_reader :bot, :message, :user

    def initialize(args)
      @bot = args[:bot]
      @message = args[:message]
      @user = args[:user]
    end

    def respond
      case message
      when Telegram::Bot::Types::CallbackQuery
        markup, response_msg = compose_buttons(data: message.data, execute: :execute_and_generate_markup)
        send_message(response_msg, markup)
      when Telegram::Bot::Types::Message
        if message.reply_to_message.present?
          Bot::ReplyHandlers::HandlerRunner.new(replied_msg: message.reply_to_message,
                                                reply_msg: message,
                                                user: user).call
        else
          markup, response_msg = compose_buttons(execute: :generate_markup)
          send_message(response_msg, markup)
        end
      else
        puts "Something error"
      end
    rescue => e
      p e # TODO: should be a logger over here
    end

    def compose_buttons(data: nil, execute:)
      composer      = Bot::Buttons::ButtonsComposer.new(user: user, callback: data)
      markup        = composer.send execute
      response_msg  = composer.response_message

      [markup, response_msg]
    end

    def send_message(msg, keyboard_markup)
      bot.api.send_message(
        parse_mode:   "html",
        chat_id:      message.from.id,
        text:         msg,
        reply_markup: keyboard_markup
      )
    end
  end
end
