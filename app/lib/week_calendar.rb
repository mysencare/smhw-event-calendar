class WeekCalendar

  attr_reader :days_range, :events

  def initialize
    @days_range = Date.current.beginning_of_week..Date.current.end_of_week
    @events = CalendarEvent.where('starts_at >= ? AND ends_at <= ?', @days_range.min, @days_range.max).to_a
  end

end
