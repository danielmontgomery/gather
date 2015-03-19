class AddAgeToUser < ActiveRecord::Migration
  def change
    add_column :users, :age, :integer
    add_column :users, :currently_traveling, :boolean
  end
end
