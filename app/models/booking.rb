class Booking < ApplicationRecord
  belongs_to :iteration, optional: true
  belongs_to :user
  has_one :review
  has_many_attached :photos
  after_validation :assign_iteration, on: :create

  def countdown
    (iteration.start_date.to_i - Time.zone.now.to_i)/(60*60)
  end

  def event_is_tomorrow?
    countdown < 24
  end

  private

  def assign_iteration
    iterations = Iteration.all
    iterations = iterations.where(start_date: start_date..end_date)
    iterations = iterations.joins(:event).where.not(events: { category_id: exclude_category_ids  })
    iterations = iterations.where('price < ?', budget)
    iterations = iterations.where(event_id: Event.near(city, 10).map(&:id))
    iterations = iterations.joins(:event).where(events: { language: languages  })
    iterations = iterations.joins(:event).where(events: { audience: audiences  })
    self.iteration = iterations.sample || Iteration.all.sample
  end
end
