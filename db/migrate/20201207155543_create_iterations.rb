class CreateIterations < ActiveRecord::Migration[6.0]
  def change
    create_table :iterations do |t|
      t.datetime :start_date
      t.integer :price
      t.references :event, null: false, foreign_key: true

      t.timestamps
    end
  end
end
