class BookingOption
  include ActiveModel::Model
  attr_accessor :languages, :audiences

  validates :languages, presence: true
  validates :audiences, presence: true
end
