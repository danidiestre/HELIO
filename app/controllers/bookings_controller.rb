class BookingsController < ApplicationController
  def loading
    @booking = Booking.find(params[:id])
  end
end
