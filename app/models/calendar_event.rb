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

  validates_presence_of :title, :subject, :teacher, :starts_at, :ends_at

  validate :validate_duration_range

  def days_duration
    (ends_at - starts_at).to_i + 1
  end

  def week_days_offset
    (starts_at - Date.current.beginning_of_week).to_i
  end

  private

  def validate_duration_range
    if starts_at && ends_at && (ends_at - starts_at).to_i < 0
      errors[:base] << 'Invalid dates range'
    end
  end

end
