class CommentsController < ApplicationController
	def index
		@comments = Comment.where(trip_id: params[:id])
	end

	def create
		@trip = Trip.where(id: params[:trip_id]).first
		@comment = @trip.comments.new(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to trip_path(id: params[:trip_id])
		else
			raise params.inspect
		end
	end

	def destroy
		@trip = Trip.where(id: params[:trip_id]).first
		@comment = @trip.comments.find(params[:id])
		@comment.destroy
		redirect_to trip_path(@trip)
	end

	private
	def comment_params
		params.require(:comment).permit(:trip_id, :user_id, :body)
	end
end
