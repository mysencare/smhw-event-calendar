RSpec.feature 'Add event' do
  scenario 'Calendar shows added event', :js do
    visit events_path
    fill_in('Description', with: 'newcomer')
    click_button('Add event')
    within :css, '#calendar' do
      expect(page).to have_content('newcomer')
    end
  end

  # TODO: specs for formatting, days, etc
end
