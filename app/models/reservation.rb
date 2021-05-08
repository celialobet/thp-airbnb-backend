class Reservation < ApplicationRecord
  belongs_to :guest, class_name: 'User'
  belongs_to :listing

  before_create :start_must_be_before_end_date

  def get_duration
    reserv = self.end_date.to_i - self.start_date.to_i
    return reserv / 60 / 60 / 24
  end


  private

  def start_must_be_before_end_date
    errors.add(:start_time, "must be before end time") unless
      start_date < end_date
  end

end
