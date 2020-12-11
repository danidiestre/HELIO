class EventsController < ApplicationController
    def show
        @event = Event.find(params[:id])
#        @reviews = @event.reviews
#        @markers = [{ lat: @event.latitude, lng: @event.longitude, infoWindow: render_to_string(partial: "info_window", locals: { event: @event }), image_url: helpers.asset_url('logo-3.png') }]
    end
end
