class BookingCategoriesController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_categories = BookingCategory.new
  end

  def create
  end
end
