class Booking < ApplicationRecord
  belongs_to :iteration, optional: true
  belongs_to :user
  has_one :review
  has_many_attached :photos
  after_validation :assign_iteration


  def countdown
    (iteration.start_date.to_i - Time.zone.now.to_i)/(60*60)
  end

  def event_is_tomorrow?
    countdown < 30
  end

  def assign_iteration
    self.iteration = Iteration.all.sample
  end
end
