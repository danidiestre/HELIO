class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
        @reviews = @event.reviews
        @review = Review.new
        @markers =[
            {
                lat: @event.latitude,
                lng: @event.longitude
            }
        ]
    end
end
