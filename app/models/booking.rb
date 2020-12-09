class Booking < ApplicationRecord
  belongs_to :iteration, optional: true
  belongs_to :user
  has_one :review
  has_many_attached :photos
  after_validation :assign_iteration

  def assign_iteration
    self.iteration = Iteration.all.sample
  end
end
