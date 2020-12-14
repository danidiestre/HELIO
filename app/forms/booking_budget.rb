class BookingBudget
  include ActiveModel::Model
  attr_accessor :budget, :cancellation_insurance

  validates :budget, presence: true
  validates :cancellation_insurance, presence: true

  def total_price_cents(participants)
    budget.to_i * participants * 100
  end
end
