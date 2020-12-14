class BookingCheckoutController < ApplicationController


  def new

    @booking = Booking.find(params[:booking_id])


    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: "Helio event",
        amount: @booking.total_price_cents,
        currency: 'eur',
        quantity: 1
      }],
      success_url: loading_booking_url(@booking),
      cancel_url: root_url
    )

   @booking.update(checkout_session_id: session.id)
  end
end
