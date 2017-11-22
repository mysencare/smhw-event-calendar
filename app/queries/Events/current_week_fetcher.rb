module Events
  class CurrentWeekFetcher
    def initialize(date)
      @date = date
    end

    def fetch
      Event.where(start_date: week_dates)
           .or(Event.where(end_date: week_dates))
           .or(Event.where('start_date < ? AND end_date > ?', beginning_of_week, end_of_week))
    end

    private

    def week_dates
      @week_dates ||= beginning_of_week..end_of_week
    end

    def beginning_of_week
      @date.beginning_of_week
    end

    def end_of_week
      @date.end_of_week
    end
  end
end
