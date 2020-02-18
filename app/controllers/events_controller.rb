class EventsController < ApplicationController
	require 'date'
	require 'time'

	def index
		@events = Event.all	
		@attendances = Attendance.all
	end

	def new
		@event = Event.new
	end

	def create
		@event = Event.new('title' => params[:title],
    										'start_date' => params[:start_date],
    										'duration' => params[:duration],
    										'description' => params[:description],
    										'price' => params[:price],
    										'location' => params[:location],
    										'admin_id' => current_user.id)

    if @event.save
    	redirect_to events_path
    else 
    	render 'events/new'
    end
	end

	def show
		@event = Event.find(params[:id])
		@attendances = Attendance.where(event_id: @event.id).count
	end

end
