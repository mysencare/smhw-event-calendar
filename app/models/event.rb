class Event < ApplicationRecord
  validate :starts_before_the_end?

  def starts_before_the_end?
    if start_at > end_at
      raise StandardError.new('start_at > end_at')
    end
  end
end
