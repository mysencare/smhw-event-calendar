RSpec.describe Services::Events::Viewer do
  let(:today) { Date.current }

  it 'returns events for the current week' do
    before_this_week = Date.current.beginning_of_week - 1.day
    Services::Events::Creator.new.call(before_this_week, before_this_week)
    Services::Events::Creator.new.call(today, today)
    after_this_week = Date.current.end_of_week + 1.day
    Services::Events::Creator.new.call(after_this_week, after_this_week)
    events = subject.call
    expect(events.count).to eq(1)
  end
end
