class BookingOptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_options = BookingOption.new
  end

  def create
    @booking_options = BookingOption.new(booking_options_params)
    if @booking_options.valid?
      session[:booking_params].merge!({
        languages: @booking_options.languages,
        audiences: @booking_options.audiences
      })
      redirect_to new_booking_budget_path
    else
      render :new
    end
  end

  private

  def booking_options_params
    params.require(:booking_option).permit(languages: [], audiences: [])
  end
end
