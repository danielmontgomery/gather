class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.references :user, index: true
      t.integer :rating
      t.text :description

      t.timestamps null: false
    end
    add_foreign_key :references, :users
  end
end
