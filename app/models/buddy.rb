class Buddy < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings

  validates :name, :buddy_type, :skills, :description, :activities, :rate, :location, presence: true
  #length of description
  #collection of types to choose from?

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
