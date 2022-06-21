class Buddy < ApplicationRecord
  belongs_to :user

  validates :name, :type, :skills, :description, :activities, :rate, presence: true
  #length of description
  #collection of types to choose from?

end
