class Listing < ApplicationRecord
  validates :available_beds,
    presence: true,
    numericality: { only_integer: true, :greater_than => 0 },
  validates :prices,
    presence: true,
    numericality: { only_integer: true, :greater_than => 0  }
  validates :description, 
    presence: true,
    length: { minimum: 140 }
  validates :welcome_message, 
    presence: true

  belongs_to :administrator, class_name: 'User'
  has_many :reservations
  belongs_to :city
end
