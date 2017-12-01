module Services
  module Events
    class Creator
      attr_reader :events

      def initialize(events = Event)
        @events = events
      end

      def call(start_at, end_at, description = '')
        events.create!(start_at: start_at, end_at: end_at, description: description)
      end
    end
  end
end
