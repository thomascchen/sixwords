require 'rails_helper'

feature 'user searches by keyword', %Q{
  As a Bostonian
  I want to search for memoirs by keyword
  So that I can discover memoirs on a particular topic
} do

  # Acceptance Criteria:
  # [ ] User is able to navigate to a search page from any page
  # [ ] User is able to enter one or more keywords that search all fields in the database as separate case insensitive keywords
  # [ ] User should be taken to a results page that displays all memoirs that match that search
  # [ ] User should be given an error message if they submit an empty search

  scenario 'user navigates to a search page' do
    visit root_path
    click_link "Search"

    expect(page.has_selector('form')).to be(true)
  end
end
