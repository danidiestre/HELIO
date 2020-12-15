class IterationsController < ApplicationController
  def show
    @event = Event.find(params[:id])
    @iteration = Iteration.find(params[:id])
  end
end
