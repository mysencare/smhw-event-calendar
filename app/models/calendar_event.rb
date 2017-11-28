class CalendarEvent < ActiveRecord::Base
  SUBJECTS = [
    '01A Maths',
    '01A Physics',
    '01A Literature',
    '01A Programming',
  ]
  TEACHERS = [
    'Mr N Gohil',
    'Mr L Lukomskyi',
    'Mr S Westwood',
    'Ms A Suprun',
  ]

  def days_duration
    (ends_at - starts_at).to_i
  end

  def week_days_offset
    (starts_at - Date.current.beginning_of_week).to_i
  end

end
