require 'rails_helper'

describe Events::Creator do
  subject { described_class.new(event_params) }

  let(:event_params) do
    { name: name, start_date: Date.current, description: '' }
  end

  context 'invalid Event params' do
    let(:name) { '' }

    it 'does not create a new object' do
      expect { subject.call }.not_to change { Event.count }
    end

    it 'returns Event instance populated with suplied event_params' do
      event = subject.call
      expect(event.start_date).to eq(event_params[:start_date])
    end
  end

  context 'valid Event params' do
    let(:name) { 'name' }

    it 'creates new Event object' do
      expect { subject.call }.to change { Event.count }.by(1)
    end

    it 'returns a new Event instance', :aggregate_failures do
      event = subject.call
      expect(event).to be_a(Event)
      expect(event.name).to eq(nil)
      expect(event.start_date).to eq(nil)
      expect(event.end_date).to eq(nil)
      expect(event.description).to eq(nil)
    end
  end
end
