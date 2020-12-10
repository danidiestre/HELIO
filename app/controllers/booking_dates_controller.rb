class BookingDatesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_dates = BookingDate.new
  end

  def create
    @booking_dates = BookingDate.new(extract_dates)
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

  def extract_dates
    dates = params[:booking_date][:dates].split(" to ")
    { start_date: dates[0], end_date: dates[1] }
  end

  private

  def booking_dates_params
    params.require(:booking_date).permit(:dates)
  end
end
