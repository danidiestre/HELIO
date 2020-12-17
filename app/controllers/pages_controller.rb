class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @booking_initial_data = BookingInitialData.new
    @reviews = Review.order(:rating).limit(3)
    @events = Event.all
  end

  def dashboard
    @upcoming_bookings = current_user.bookings.joins(:iteration).where("iterations.start_date > ?", DateTime.now).order("iterations.start_date")
    @past_bookings = current_user.bookings.joins(:iteration).where("iterations.start_date <= ?", DateTime.now).order("iterations.start_date DESC")
  end
end
