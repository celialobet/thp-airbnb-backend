class ReservationValidator < ActiveRecord::Validator
  def validate(record)
  end
end

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

  before_create :overlaping_reservation

  def overlaping_reservation?(datetime)
    self.reservations.each do |res|
      if res.start_date.to_i <= datetime.to_i && datetime.to_i < res.end_date.to_i
        return true 
      else
        return false
      end
    end
  end


end
