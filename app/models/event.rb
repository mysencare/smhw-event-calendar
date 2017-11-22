class Event < ApplicationRecord
  validates :name, :start_date, presence: true
end
