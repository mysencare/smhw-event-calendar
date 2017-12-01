class Event < ApplicationRecord
  validate :starts_before_the_end?

  scope :current_week, -> do
    where(
      'start_at >= ? AND start_at <= ?',
      Date.current.beginning_of_week,
      Date.current.end_of_week
    )
  end

  def starts_before_the_end?
    if start_at > end_at
      raise StandardError.new('start_at > end_at')
    end
  end
end
