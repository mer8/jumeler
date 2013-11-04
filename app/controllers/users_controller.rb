class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		@user = User.create(params[:user].permit(:username, :email, :password, :password_confirmation))
		redirect_to action: "new"
	end

	# Might have to delete this, for showing list of users.
	def index
		@user = User.all
	end

	def makeadmin
	end

	# def show
	# 	@user = User.find(params[:id])
	# end
end