class AddMeetingPointToTrip < ActiveRecord::Migration
  def change
    add_column :trips, :meeting_point, :string
  end
end
