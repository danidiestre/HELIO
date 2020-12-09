class BookingDatesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_dates = BookingDate.new
  end

  def create
    @booking_dates = BookingDate.new(booking_dates_params)
    if @booking_dates.valid?
      session[:booking_params] = {
        start_date: @booking_dates.start_date,
        end_date: @booking_dates.end_date
      }
      redirect_to new_booking_category_path
    else
      render :new
    end
  end

  private

  def booking_dates_params
    params.require(:booking_date).permit(:start_date, :end_date)
  end
end
