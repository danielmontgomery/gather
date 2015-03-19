class AddFirstNameToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :education, :string
    add_column :users, :about, :string
    add_column :users, :occupation, :string
    add_column :users, :hometown, :string
    add_column :users, :interests, :string
    add_column :users, :past_homes, :string
    add_column :users, :past_travels, :string
    add_column :users, :future_travels, :string
    add_column :users, :travel_style, :string
    add_column :users, :location, :string
  end
end
