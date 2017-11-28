class EventsController < ApplicationController

  def index
    @week_calendar = WeekCalendar.new
    @new_event = CalendarEvent.new(starts_at: Date.current.beginning_of_week,
                                   ends_at: Date.current.beginning_of_week)
  end

  def create
    head 422
  end

end
