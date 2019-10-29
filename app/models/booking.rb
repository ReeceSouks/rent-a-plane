class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :airplane
  has_many :reviews
end
