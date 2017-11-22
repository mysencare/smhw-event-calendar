class DatesOrderValidator < ActiveModel::Validator
  def validate(record)
    return if record.end_date.nil?
    msg = 'end_date should be equal or greater then start_date'
    record.errors[:base] << msg if record.start_date > record.end_date
  end
end
