class EventsController < ApplicationController
  def index
    event  = Event.new
    events = Event.all
    render :index, locals: { event: event, events: events }
  end

  def create
    event = Event.new(event_params)
    event = event.save ? Event.new : event
    render :create, locals: { event: event }
  end

  private

  def event_params
    params
      .require(:event)
      .permit(:name, :start_date, :end_date, :description)
  end
end
