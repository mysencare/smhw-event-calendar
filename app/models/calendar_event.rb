class CalendarEvent < ActiveRecord::Base

  def days_duration
    (ends_at - starts_at).to_i
  end

  def week_days_offset
    (starts_at - Date.current.beginning_of_week).to_i
  end

end
