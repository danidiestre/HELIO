class BookingInitialDataController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @booking_initial_data = BookingInitialData.new(booking_initial_data_params)
    if @booking_initial_data.valid?
      session[:booking_params] = {
        address: @booking_initial_data.address,
        participants: @booking_initial_data.participants
      }
      redirect_to new_booking_date_path
    else
      render "pages/home"
    end
  end

  private

  def booking_initial_data_params
    params.require(:booking_initial_data).permit(:address, :participants)
  end
end
