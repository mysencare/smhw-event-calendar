RSpec.feature 'Add event' do
  scenario 'Calendar shows added event', :js do
    visit events_path
    fill_in('Description', with: 'newcomer')
    click_button('Add event')
    within :css, '#calendar' do
      expect(page).to have_content('newcomer')
    end
  end

  context 'No description' do
    scenario 'Shows an error', :js do
      visit events_path
      expect(page).to have_css('#calendar.fc')
      click_button('Add event')
      sleep 1 # TODO: add helper to wait for the alert without sleep
      expect(page.driver.browser.switch_to.alert.text).to eq("Description can't be blank")
    end
  end
end
