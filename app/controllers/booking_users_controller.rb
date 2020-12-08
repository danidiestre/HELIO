class BookingUsersController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_users = BookingUser.new
  end

  def create
    @booking_users = BookingUser.new(booking_users_params)
    if @booking_users.valid?

    full_params = user_account_params.merge(
      first_name: session['user_profile']['first_name'],
      last_name: session['user_profile']['last_name']
    )
    User.create!(full_params)
    session.delete('user_profile')
    # redirect_to new_booking_budget_path
    else
      render :new
    end
  end

  private

  def booking_users_params
    params.require(:booking_users).permit(:email, :encrypted_password)
  end
end
