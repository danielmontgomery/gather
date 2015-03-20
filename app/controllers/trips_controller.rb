class TripsController < ApplicationController
	def index
		if params[:search].present?
			@trips = Trip.near(params[:search], 70, :order => :distance)
		else
			@trips = Trip.all
		end
		# @allTrips = Trip.all
		# @user = current_user
		# if current_user != nil
		# 	@allUserTrips = @user.trips_organized.all
		# end
	end
	def show
		@trip = Trip.where(id: params[:id]).first
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
