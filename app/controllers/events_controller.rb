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
		e = Event.create(params[:event].permit(:date, :time, :name))
		redirect_to events_url
		# :action => "show" , :id =>@event._id
	end

	def destroy
		Event.find(params[:id]).destroy
		redirect_to users_url
	end
end

