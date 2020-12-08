class BookingOptionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_options = BookingOption.new
  end

  def create
  end
end
