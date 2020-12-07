class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.date :start_date
      t.date :end_date
      t.integer :budget
      t.string :city
      t.string :languages, array: true
      t.string :audiences, array: true
      t.boolean :cancellation_insurance
      t.integer :exclude_category_ids, array: true
      t.references :iteration, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
