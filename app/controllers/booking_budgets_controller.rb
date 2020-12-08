class BookingBudgetsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @booking_budgets = BookingBudget.new
  end

  def create
    @booking_budgets = BookingBudget.new(booking_budgets_params)
    if @booking_budgets.valid?
      session[:booking_budget] = {
        'budget' => @booking_budgets.budget,
        'cancellation_insurance' => @booking_budgets.cancellation_insurance
      }
      redirect_to new_booking_category_path
    else
      render :new
    end
  end

  private

  def booking_budgets_params
    params.require(:booking_budget).permit(:budget, :cancellation_insurance)
  end
end
