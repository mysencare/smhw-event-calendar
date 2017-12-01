RSpec.feature 'Calendar' do
  scenario 'Shows events for the current week' do
    xss = '<script>alert("No XSS :P");</script>'
    Services::Events::Creator.new.call(Date.current, Date.current, xss)
    visit events_path
    expect(page).to have_content(xss)
  end

  # TODO: specs for formatting, days, etc
end
