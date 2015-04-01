class UsersController < ApplicationController
	def index
	end

	def create
		@user = current_user
		@reference = @user.references.new(reference_params)
		@reference.recipient_id = User.where(id: params[:id]).first
		if @reference.save && @reference.recipient_id != nil
			redirect_to user_path(id: params[:id])
		else
			raise params.inspect
		end
		# @user = current_user
		# @reference = @user.references.new(reference_params)
		# @reference.user = User.where(id: params[:user_id]).first

	end


	def show
		@references = Reference.where(recipient_id: params[:id])
		@user = User.where(id: params[:id]).first
	end

	private
	def reference_params
		params.require(:reference).permit(:rating, :user_id, :description, :recipient_id)
	end
end
