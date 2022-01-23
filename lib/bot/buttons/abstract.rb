module Bot
  module Buttons
    class Abstract
      def markup
        raise "Not implemented yet"
      end

      def execute
        raise "Not implemented yet"
      end

      def force_reply
        raise "Not implemented yet"
      end

      def response_message
        raise "Not implemented yet"
      end
    end
  end
end
