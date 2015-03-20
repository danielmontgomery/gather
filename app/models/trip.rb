class Trip < ActiveRecord::Base
	has_many :trip_users
	has_many :users, through: :trip_users
	belongs_to :organizer, class_name: "User", foreign_key: :organizer_id, inverse_of: :trips_organized
	after_save :organizer_added
	geocoded_by :meeting_point
	after_validation :geocode, :if => :meeting_point_changed?
	def organizer_added
		if TripUser.where(trip: self, user: self.organizer).first == nil
			self.organizer.trip_users.create(trip:self)
		end
	end
end
