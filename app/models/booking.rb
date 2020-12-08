class Booking < ApplicationRecord
  belongs_to :iteration
  belongs_to :user
  has_one :review
  has_many_attached :photos
end
