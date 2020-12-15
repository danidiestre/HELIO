class BookingInitialData
  include ActiveModel::Model
  attr_accessor :city, :participants, :guest_email

  validates :city, presence: true
  validates :participants, presence: true
end
