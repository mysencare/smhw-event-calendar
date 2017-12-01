class EventsController < ApplicationController
  def index
    @events = Services::Events::Viewer.new.call
  end

  def create
    event = Services::Events::Creator.new.call(
      Date.iso8601(params[:start_at]),
      Date.iso8601(params[:end_at]),
      params[:description].strip
    )
    render json: event, status: :created
  rescue StandardError => e
    render json: e.message, status: :bad_request
  end
end
