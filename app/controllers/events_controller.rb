class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
#       @reviews = @event.reviews
        @markers =[
            {
                lat: @event.latitude,
                lng: @event.longitude
            }
        ] 
    end
end
