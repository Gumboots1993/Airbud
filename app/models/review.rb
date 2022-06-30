class Review < ApplicationRecord
  belongs_to :booking

  validates :rating, presence: true
  validates :rating, inclusion: [1, 2, 3, 4, 5]
end
