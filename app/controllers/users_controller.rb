class UsersController < ApplicationController
	def index
	end
	def show
		@references = Reference.where(user_id: params[:id])
		@user = User.where(id: params[:id]).first
	end
end
