class Airplane < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, through: :bookings
  mount_uploader :photo, PhotoUploader
  geocoded_by :airport
  after_validation :geocode, if: :will_save_change_to_airport?
  def unavailable_dates
    bookings.pluck(:start_date, :end_date).map do |range|
      { from: range[0], to: range[1] }
    end
  end
end
