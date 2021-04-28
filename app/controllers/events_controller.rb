class EventsController < ApplicationController
  before_action :authorize, only: [:new, :create]
  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      redirect_to @event, notice: "Event created!"
    else
      render "new"
    end
  end

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def attend
    @event = Event.find(params[:id])
    @event.attendees << current_user
    redirect_to @event, notice: "Event attended!"
  end

  def unattend
    @event = Event.find(params[:id])
    @event.event_attendances.find_by(attendee_id: current_user.id).destroy
    redirect_to @event, notice: "Event unattended!"
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
