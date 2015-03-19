class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :trip, index: true

      t.timestamps null: false
    end
    add_foreign_key :comments, :trips
  end
end
