class BookingDate
  include ActiveModel::Model
  attr_accessor :start_date, :end_date, :dates

  validates :start_date, presence: true
  validates :end_date, presence: true
end
