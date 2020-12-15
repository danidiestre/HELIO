class Event < ApplicationRecord
  has_many :iterations
  has_many :bookings, through: :iterations
  has_many :reviews, through: :bookings
  belongs_to :category
  has_one_attached :photo
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def average_rating()
    reviews.average(:rating).to_f
  end
end
