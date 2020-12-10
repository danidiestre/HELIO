class BookingInitialDatasController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_initial_datas = BookingInitialData.new
  end

  def create
    @booking_initial_datas = BookingInitialData.new(booking_initial_datas_params)
    if @booking_initial_datas.valid?
      session[:booking_params] = {
        address: @booking_initial_datas.address,
        participants: @booking_initial_datas.participants
      }
      redirect_to new_booking_date_path
    else
      render :new
    end
  end

  private

  def booking_initial_datas_params
    params.require(:booking_initial_datas).permit(:address, :participants)
  end
end
