class BookingBudgetsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_budgets = BookingBudget.new
  end

  def create
  end
end
