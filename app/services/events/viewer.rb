module Services
  module Events
    class Viewer
      attr_reader :events

      def initialize(events = Event)
        @events = events
      end

      def call
        events.current_week.to_a
      end
    end
  end
end
