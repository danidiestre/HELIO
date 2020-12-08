class BookingBudget
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :budget, :integer
  attribute :cancellation_insurance, :boolean

  validates :budget, presence: true
  validates :cancellation_insurance, presence: true
end
