class TripsController < ApplicationController
	def index
		@user = current_user
		puts "====================="
		puts current_user.trips_organized.first
		puts "====================="
		@allTrips = @user.trips_organized.all
	end
	def new
		@user = current_user
		@trip = @user.trips_organized.new
	end
	def create
		@user = current_user
		@trip = @user.trips_organized.new(trip_params)
		if @trip.save
			redirect_to trips_path
		else
			raise params.inspect
		end
	end
	private
	def trip_params
		params.require(:trip).permit(:title, :organizer_id)
	end
end
