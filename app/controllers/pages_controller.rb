class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @booking_initial_data = BookingInitialData.new
    @events = Event.all
  end

  def dashboard
    @upcoming_bookings = current_user.bookings.joins(:iteration).where("iterations.start_date > ?", DateTime.now)
    @past_bookings = current_user.bookings.joins(:iteration).where("iterations.start_date <= ?", DateTime.now)
  end
end
