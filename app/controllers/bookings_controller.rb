class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @iteration = @booking.iteration
    @event = @iteration.event
  end

  def loading
    @booking = Booking.find(params[:id])
  end
end
