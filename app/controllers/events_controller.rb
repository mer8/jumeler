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
		
		# @event = Event.all
		# render :json => @event

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


	# I commented this out bc. I was getting an error in the Edit Event tab
	def edit
		@event = Event.find(params[:id])

	end

	def update
		@event = Event.find(params[:id])

		if @event.update_attributes(params[:event].permit(:date, :time, :name))
			redirect_to action: 'show', id: @event
		else
			render 'edit'
		end
	end





	def destroy
		Event.find(params[:id]).destroy
		redirect_to users_url
	end
end

