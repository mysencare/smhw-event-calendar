require 'rails_helper'

RSpec.describe EventsController do
  fixtures :all

  it 'renders #index' do
    get events_path
    expect(response).to be_success
    expect(response.body).to include('Mr N Gohil')
  end

  describe '#create' do
    let(:valid_event_args) do
      {
        title: "This is a title",
        subject: "01A Maths",
        teacher: "Mr L Lukomskyi",
        starts_at: Date.current.beginning_of_week + 2.day,
        ends_at: Date.current.beginning_of_week + 5.day,
      }
    end

    it 'creates event' do
      expect {
        post events_path, calendar_event: valid_event_args
      }.to change { CalendarEvent.count }.by(1)
      expect(response).to be_success
      expect(json_response.keys).to eq([:append_item])
    end

    it 'fails to create event' do
      invalid_event_args = valid_event_args.merge(title: '')

      expect {
        post events_path, calendar_event: invalid_event_args
      }.to change { CalendarEvent.count }.by(0)
      expect(response).not_to be_success
      expect(json_response.keys).to eq([:message])
    end
  end

end
