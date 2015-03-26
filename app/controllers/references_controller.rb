class ReferencesController < ApplicationController
	def index
		@references = Reference.where(user_id: params[:id])
		puts '============================='
		puts 'References'
		puts @references
		puts '============================='
		raise params.inspect
	end

	def create
		@user = User.where(id: params[:user_id]).first
		@reference = @user.references.create(reference_params)
		@reference.user = current_user
		if @reference.save
			redirect_to trip_path(id: params[:user_id])
		else
			raise params.inspect
		end
	end
	private
	def reference_params
		params.require(:reference).permit(:rating, :user_id, :description)
	end
end
