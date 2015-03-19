class CreateTripUsers < ActiveRecord::Migration
  def change
    create_table :trip_users do |t|
      t.references :user, index: true
      t.references :trip, index: true

      t.timestamps null: false
    end
    add_foreign_key :trip_users, :users
    add_foreign_key :trip_users, :trips
  end
end
