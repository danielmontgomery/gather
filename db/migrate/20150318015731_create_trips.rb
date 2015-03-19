class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :title
      t.string :description
      t.date :day
      t.time :departure_time
      t.integer :price
      t.string :duration
      t.integer :size
      t.integer :require_rating
      t.references :organizer, index: true

      t.timestamps null: false
    end
    add_foreign_key :trips, :users, column: :organizer_id
  end
end
