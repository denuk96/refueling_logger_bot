require_relative "../settings"

module Bot::Buttons
  class ButtonsComposer
    attr_reader :user, :callback, :structure, :markup, :response_message, :chosen_button, :structure_value

    SPECIAL_COMMANDS = {
      execute:     -> (composer) { composer.execute_chosen_btn; nil },
      force_reply: -> (composer) { composer.execute_chosen_btn; composer.chosen_button.force_reply }
    }.freeze

    def initialize(user:, callback: nil, structure: nil)
      @user = user
      @callback = callback&.to_sym
      @structure = structure || Bot::Settings::STRUCTURE
    end

    def execute_and_generate_markup
      set_chosen_btn
      command = SPECIAL_COMMANDS[structure_value]
      if command
        command.call(self)
      else
        generate_markup
      end
    end

    def generate_markup
      unless callback
        @response_message = "Choose option"
        return @markup    = collect_buttons(structure.keys)
      end

      set_response_msg
      @markup = if structure_value.is_a? Array
        collect_buttons(structure_value)
      elsif structure_value.is_a? Hash
        collect_buttons(structure_value.keys)
      end
    end

    def execute_chosen_btn
      chosen_button.execute
      set_response_msg
    end

    private
    def collect_buttons(buttons_names_array)
      buttons_array = buttons_names_array.map { |name| Bot::Settings::AVAILABLE_BUTTONS[name].new.markup }.compact
      Telegram::Bot::Types::InlineKeyboardMarkup.new(inline_keyboard: buttons_array)
    end

    def set_chosen_btn
      @chosen_button ||= Bot::Settings::AVAILABLE_BUTTONS[callback].new
    end

    def set_response_msg
      @response_message = chosen_button.response_message
    end

    def structure_value
      @structure_value ||= structure.deep_find(callback)
    end
  end
end
