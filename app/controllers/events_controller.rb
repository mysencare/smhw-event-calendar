class EventsController < ApplicationController

  def index
    @week_calendar = WeekCalendar.new
    @new_event = CalendarEvent.new(starts_at: Date.current.beginning_of_week,
                                   ends_at: Date.current.end_of_week)
  end

  def create
    event = CalendarEvent.new(calendar_event_params)

    if event.save
      append_item = render_to_string(partial: 'week_calendar_event', locals: {event: event})
      render json: {append_item: append_item}
    else
      render json: {message: event.errors.full_messages.join('; ')}, status: :unprocessable_entity
    end
  end

  private

  def calendar_event_params
    params.require(:calendar_event).permit(:title, :subject, :teacher, :starts_at, :ends_at)
  end

end
