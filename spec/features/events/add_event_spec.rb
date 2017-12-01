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

  # TODO: inconsistent alert err, fix spec!
  context 'No description' do
    xscenario 'Shows an error', :js do
      visit events_path
      # TODO: wait until page loaded
      click_button('Add event')
      expect(page.driver.browser.switch_to.alert.text).to eq("Description can't be blank")
    end
  end
end
