class FriendsController < ApplicationController
	def new

		@user= current_user
		@friend= User.find(params[:user_id])
		@user.origin_friends << @friend # a = destination_user(params[:user_id])
		# @user.save

	end
end