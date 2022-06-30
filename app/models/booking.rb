class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :buddy
  has_many :reviews
end
