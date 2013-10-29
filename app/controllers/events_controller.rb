class EventsController < ApplicationController
	def index
		if current_user
			@events = current_user.uevents
		else
			redirect_to root_url
		end
	end

	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
	end

	def create
		# I commented below out bc. I was tring to make it so you have to fill in the fields otherwise you'll get an error. I can't get it to work
		# if params[:date][:time][:name].present?

		current_user.uevents.create(params[:event].permit(:date, :time, :name))
		redirect_to events_url
		# I comment this below out because it was redirecting to a bad page
		# :action => "show" , :id =>@event._id



		# I commented below out bc. I was tring to make it so you have to fill in the fields otherwise you'll get an error. I can't get it to work
		# else
		# 	flash.now.alert = "Unable to create event. Please try again."
		# 	render :new
		# end
	end

	# def edit
	# 	@event = Event.edit
	# end

	# def update
	# 	current_user.uevents.update(params[:event].permit(:date, :time, :name))
	# end


	def destroy
		Event.find(params[:id]).destroy
		redirect_to users_url
	end
end

