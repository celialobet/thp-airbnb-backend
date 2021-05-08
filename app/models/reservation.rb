class Reservation < ApplicationRecord
  belongs_to :guest, class_name: 'User'
  belongs_to :listing


  private

  def start_must_be_before_end_date
    errors.add(:start_time, "must be before end time") unless
      start_date < end_date
  end

  def get_duration
    reserv = self.end_date.to_i - self.start_date.to_i
    return res / 60 / 60 / 24
  end

end
