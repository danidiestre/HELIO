class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :language
      t.string :address
      t.string :audience
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
