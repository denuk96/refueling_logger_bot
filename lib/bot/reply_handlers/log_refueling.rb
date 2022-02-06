module Bot
  module ReplyHandlers
    class LogRefueling < Abstract
      def call(params = {})
        message = params[:reply_msg]
        user    = params[:user]
        refueling_data = message.text.split(',').map(&:to_f)
        odometer, amount, price = refueling_data
        refuelings = user.refuelings.build(odometer: odometer, amount: amount, price: price)
        refuelings.save!

        'Saved.'
      end
    end
  end
end
