class Event < ApplicationRecord
  has_many :iterations
  belongs_to :category
  has_many :bookings, through: :iterations
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  has_many :reviews, through: :bookings
end
