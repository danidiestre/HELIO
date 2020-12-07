class Booking < ApplicationRecord
  belongs_to :iteration
  belongs_to :user
  has_one :review
end
