module Events
  class Creator
    def initialize(event_params)
      @event_params = event_params
    end

    def call
      event = Event.new(@event_params)
      event.save ? Event.new : event
    end
  end
end
