class BookingInitialData
  include ActiveModel::Model
  attr_accessor :city, :participants

  validates :city, presence: true
  validates :participants, presence: true
end
