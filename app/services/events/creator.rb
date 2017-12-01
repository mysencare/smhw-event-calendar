module Services
  module Events
    class Creator
      attr_reader :events

      def initialize(events = Event)
        @events = events
      end

      def call(start_at, end_at, description = '')
        event = events.new(start_at: start_at, end_at: end_at, description: description)
        if event.invalid?
          raise StandardError.new(event.errors.full_messages.join('; '))
        end
        event.save!
        event
      end
    end
  end
end
