class AuthenticationsController < ApplicationController
	before_action :authenticate_user, only: [:destroy]

	def new
		# Are they already logged in?
		if current_user # They are! Can't create them again.
			redirect_to users_url
		else
			@user = User.new

			# render :new
		end
	end


	def create
		if params[:user][:email].present?
			
		
		    	user = User.find_by(email: params[:user][:email])
		    	if user
		        # authenticate user
		        if user.authenticate(params[:user][:password])
		          session[:user_id] = user.id
		          redirect_to root_url
		        else
		          flash.now.alert = "Unable to sign you in. Please try again."
		          render :new
		        end
	    	end
	    else
		          flash.now.alert = "Unable to sign you in. Please try again."
		          render :new
	    end
	end

  def destroy
    session[:user_id] = nil
    redirect_to authentications_new_url,
     notice: "You signed out."
  end

end



