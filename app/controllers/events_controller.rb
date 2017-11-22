class EventsController < ApplicationController
  def index
    event  = Event.new
    events = Event.all
    render :index, locals: { event: event, events: events }
  end
  end
end
