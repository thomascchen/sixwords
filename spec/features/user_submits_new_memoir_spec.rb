require 'rails_helper'

feature 'user submits new memoir', %Q{
  As a Bostonian
  I want to submit six word memoirs
  So that I can share my story with people in my city
} do

  # Acceptance Criteria:
  # [ ] User is able to navigate to submission page from index page and details page
  # [ ] User is able to view form for name, age, neighborhood, and memoirs on 'new memoir' page
  # [ ] User is able to successfully submit their memoir to the database
  # [ ] User should be redirected to details page for new memoir and see success message if form submitted successfully
  # [ ] User should get error message and form should be redisplayed if attempting to submit
  #     invalid or incomplete information

  scenario 'user visits new memoirs page' do
    visit root_path
    click_link 'Submit'

    expect(page.has_selector?("form")).to be(true)
  end

end
