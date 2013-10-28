class EventsController < ApplicationController
	def index
		@events = Event.all
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

		e = Event.create(params[:event].permit(:date, :time, :name))
		redirect_to events_url
		# I comment this below out because it was redirecting to a bad page
		# :action => "show" , :id =>@event._id



		# I commented below out bc. I was tring to make it so you have to fill in the fields otherwise you'll get an error. I can't get it to work
		# else
		# 	flash.now.alert = "Unable to create event. Please try again."
		# 	render :new
		# end
	end




	def destroy
		Event.find(params[:id]).destroy
		redirect_to users_url
	end
end

