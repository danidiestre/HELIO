class AddPriceToBookings < ActiveRecord::Migration[6.0]
  def change
    add_monetize :bookings, :total_price, currency: { present: false }
  end
end
