class EventsController < ApplicationController
  def index
    event = Event.new
    render :index, locals: { event: event, events: events }
  end

  def create
    event = Events::Creator.new(event_params).call
    render :create, locals: { event: event, events: events }
  end

  private

  def events
    Events::CurrentWeekFetcher.new(week_start_date).fetch
  end

  def event_params
    params
      .require(:event)
      .permit(:name, :start_date, :end_date, :description)
  end

  def week_start_date
    start_date = params[:start_date]
    start_date.present? ? Date.parse(start_date) : Date.current
  end
end
