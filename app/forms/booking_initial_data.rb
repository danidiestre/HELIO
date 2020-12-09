class BookingInitialData
  include ActiveModel::Model
  attr_accessor :address, :participants

  validates :address, presence: true
  validates :participants, presence: true
end
