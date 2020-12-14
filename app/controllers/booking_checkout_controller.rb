class BookingCheckoutController < ApplicationController
  def new
    @booking = Booking.find(params[:booking_id])
  end
end
