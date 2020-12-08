class BookingUsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_users = BookingUser.new
  end

  def create
  end
end
