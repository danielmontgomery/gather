class ReferencesController < ApplicationController
	def index
		@references = Reference.where(recipient_id: params[:id])
		raise params.inspect
	end
	def show
		@user = User.where(id: params[:id]).first
		@references = @user.references.all
		# @theseReferences = Reference.where(user = User.last)
	end

	def new
		@references.new
	end

	def create
		@user = current_user
		@reference = @user.references.new(reference_params)
		@reference.recipient_id = User.where(id: params[:user_id]).first
		if @reference.save && @reference.recipient_id != nil
			redirect_to user_path(id: params[:user_id])
		else
			raise params.inspect
		end
	end

	def destroy
		@user = User.where(id: params[:user_id]).first
		@reference = @user.references.find(params[:id])
		@reference.destroy
		redirect_to user_path(@user)
	end
	private
	def reference_params
		params.require(:reference).permit(:rating, :user_id, :description, :recipient_id)
	end
end
