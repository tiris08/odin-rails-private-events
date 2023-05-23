class EventsController < ApplicationController
  before_action :authorize, only: %i[new create]
  before_action :set_event, only: %i[show attend unattend]

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
    @upcoming_events = Event.upcoming
    @past_events = Event.past
  end

  def show; end

  def attend
    @event.attendees << current_user
    redirect_to @event, notice: "Event attended!"
  end

  def unattend
    @event.event_attendances.find_by(attendee_id: current_user.id).destroy
    redirect_to @event, notice: "Event unattended!"
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:name, :description, :date, :location)
  end
end
