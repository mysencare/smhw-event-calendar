RSpec.describe Services::Events::Creator do
  let(:today) { Date.current }
  let(:first_event) { Event.first }

  it 'returns an event' do
    expect(subject.call(today, today)).to be_an(Event)
  end

  it 'persists an event' do
    expect {
      subject.call(today, today, 'description')
    }.to change {
      Event.count
    }.from(0).to(1)
    expect(first_event.start_at).to eq(today)
    expect(first_event.end_at).to eq(today)
    expect(first_event.description).to eq('description')
  end

  context 'wrong arguments raise StandardError' do
    it 'missing start_at' do
      expect {
        subject.call(nil, today)
      }.to raise_error StandardError
    end

    it 'missing end_at' do
      expect {
        subject.call(today, nil)
      }.to raise_error StandardError
    end

    it 'start_at > end_at' do
      expect {
        subject.call(today + 1.day, today)
      }.to raise_error StandardError
    end
  end
end
