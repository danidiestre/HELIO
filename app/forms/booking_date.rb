class BookingDate
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :start_date, :date
  attribute :end_date, :date

  validates :start_date, presence: true
  validates :end_date, presence: true
end
