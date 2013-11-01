class FriendsController < ApplicationController
	def new
		current_user.origin_friends.new(destination_user:params[:user_id])
	end
end