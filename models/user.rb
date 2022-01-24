class User < ActiveRecord::Base
  has_many :refuelings

  validates :uid, presence: true
end