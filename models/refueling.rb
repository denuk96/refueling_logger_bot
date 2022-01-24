class Refueling < ActiveRecord::Base
  belongs_to :user

  validates :amount, :odometer, presence: true
end