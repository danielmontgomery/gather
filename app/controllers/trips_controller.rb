class TripsController < ApplicationController
	def index

		if params[:search].present?
			@trips = Trip.near(params[:search], 30)
			@placeName = params[:search]
		else
			@trips = Trip.near("losangeles", 70)
			@placeName = "Los Angeles, California"
		end
		
	end
	def show
		@trip = Trip.where(id: params[:id]).first
		@tripLat = @trip.latitude
		@tripLon = @trip.longitude
		
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
		params.require(:trip).permit(:title, :organizer_id, :description, :day, :departure_time, :price, :duration, :size, :require_rating, :latitude, :longitude, :meeting_point)
	end
end
