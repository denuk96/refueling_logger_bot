require_relative "buttons/abstract"
require_relative 'buttons/base'
require_relative 'buttons/log_refueling'
require_relative 'buttons/get_stats'
require_relative "reply_handlers/abstract"
require_relative "reply_handlers/log_refueling"

module Bot
  module Settings
    STRUCTURE = {
      log_refueling: :force_reply,
      get_stats: :execute,
      # settings: {
      #   reload_location: :execute,
      #   set_time:        :force_reply,
      # }
    }.freeze

    AVAILABLE_BUTTONS = {
      log_refueling: Bot::Buttons::LogRefueling,
      get_stats:     Bot::Buttons::GetStats
    }.freeze

    BUTTONS_RESPONSE_MESSAGES = {
      log_refueling: "Input refueling data as '150000, 24.5, 32' where 1500000 - odometer, 24.5 - refueling amount, 32 - price per liter",
      get_stats: 'stats response msg'
    }.freeze

    REPLY_HANDLERS = {
      log_refueling: Bot::ReplyHandlers::LogRefueling,
    }.freeze
  end
end
