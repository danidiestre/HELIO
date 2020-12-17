class BookingBudget
  include ActiveModel::Model
  attr_accessor :budget, :cancellation_insurance

  validates :budget, presence: true
  validates :cancellation_insurance, presence: true
end
