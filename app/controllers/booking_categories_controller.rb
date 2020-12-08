class BookingCategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_categories = BookingCategory.new
  end

  def create
    @booking_categories = BookingCategory.new(booking_categories_params)
    if @booking_categories.valid?
      session[:booking_category] = {
        'name' => @booking_categories.name
      }
      redirect_to new_booking_option_path
    else
      render :new
    end
  end

  private

  def booking_categories_params
    params.require(:booking_category).permit(:name)
  end
end
