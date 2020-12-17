class BookingBudgetsController < ApplicationController
  def new
    @booking_budgets = BookingBudget.new
  end

  def create
    @booking_budgets = BookingBudget.new(booking_budgets_params)
    if @booking_budgets.valid?
      session[:booking_params].merge!({
        budget: @booking_budgets.budget,
        cancellation_insurance:  @booking_budgets.cancellation_insurance,
        state: "pending"
      })

      @booking = Booking.new(session[:booking_params])
      if session[:guest_email].nil?
        @booking.user = current_user
      else
        @booking.user = User.find_by_email(session[:guest_email]) || User.invite!(email: session[:guest_email])
      end
      @booking.save!
      session[:booking_params] = nil
      redirect_to new_booking_booking_checkout_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_budgets_params
    params.require(:booking_budget).permit(:budget, :cancellation_insurance)
  end
end
