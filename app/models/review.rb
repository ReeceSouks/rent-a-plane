class Review < ApplicationRecord
  belongs_to :booking
  # if on the schema the reviews table on associated with booking id, do we have to write belongs to user
  # if i want to display who wrote the review?
  validates :content, presence: true
  validates :rating, inclusion: { in: 0..5 }
end
