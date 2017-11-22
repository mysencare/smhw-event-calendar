class Event < ApplicationRecord
  validates :name, :start_date, presence: true
  validates_with DatesOrderValidator
end
