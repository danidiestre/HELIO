class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @booking_initial_data = BookingInitialData.new
    @reviews = Review.order(:rating).limit(3)
  end

  def dashboard
    @user_bookings = current_user.bookings
  end
end
