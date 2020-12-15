class IterationsController < ApplicationController
  def show
    @event = Event.find(params[:event_id])
    @iteration = Iteration.find(params[:id])
    @booking = current_user.bookings.find_by(iteration: @iteration)
      end
end
