class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @booking_initial_data = BookingInitialData.new
    @events = Event.all
  end

  def dashboard
    @user_bookings = current_user.bookings
  end
end
