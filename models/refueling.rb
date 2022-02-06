class Refueling < ActiveRecord::Base
  attr_accessor :consumption, :distance

  belongs_to :user

  validates :amount, :odometer, presence: true
end
