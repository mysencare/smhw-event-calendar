class EventsController < ApplicationController
  def index
    @week_calendar = WeekCalendar.new
  end
end
