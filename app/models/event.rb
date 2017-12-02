class Event < ApplicationRecord
  validates :description, presence: true
  validate :starts_before_the_end?

  scope :current_week, -> do
    where(
      'start_at >= ? AND start_at <= ?',
      Date.current.beginning_of_week,
      Date.current.end_of_week
    )
  end

  def starts_before_the_end?
    return if start_at.blank? || end_at.blank?
    if start_at > end_at
      raise StandardError.new('Start > End')
    end
  end
end
