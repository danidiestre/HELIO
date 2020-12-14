class BookingsController < ApplicationController
  def loading
    @event = Event.find(params[:id])
  end
end
