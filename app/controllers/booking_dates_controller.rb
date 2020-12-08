class BookingDatesController < ApplicationController
 skip_before_action :authenticate_user!

 def new
  @booking_dates = BookingDate.new
 end

 def create

 end
end
