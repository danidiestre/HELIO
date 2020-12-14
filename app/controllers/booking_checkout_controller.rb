class BookingCheckoutController < ApplicationController

@booking = Booking.find(params[:id])

  def new

    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      line_items: [{
        name: booking.iteration.event.title,
        amount: booking.iteration.price,
        currency: 'eur',
        quantity: 1
      }],
      success_url: dashboard_path,
      cancel_url: root_path
    )

    order.update(checkout_session_id: session.id)
      redirect_to new_booking_checkout_path
    end

end
