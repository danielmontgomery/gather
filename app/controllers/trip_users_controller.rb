class TripUsersController < ApplicationController
	def update
		@trip = Trip.where(id: params[:id]).first

		user_added = current_user.trip_users.create(trip: @trip)
		if user_added.save
			redirect_to trip_path(id: params[:id])
		end
	end
end
