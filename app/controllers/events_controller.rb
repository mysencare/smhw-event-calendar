class EventsController < ApplicationController
  def index
    @events = Services::Events::Viewer.new.call
  end
end
