class BookingsController < ApplicationController
  def show
    @booking = Booking.find(params[:id])
    @iteration = @booking.iteration
    @event = @iteration.event

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "helio_ticket",  template: "bookings/ticket.pdf.html.erb"   # Excluding ".pdf" extension.
      end
    end
  end

  def loading
    @booking = Booking.find(params[:id])
  end
end
