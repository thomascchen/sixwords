require 'rails_helper'

feature 'user searches by keyword', %Q{
  As a Bostonian
  I want to search for memoirs by keyword
  So that I can discover memoirs on a particular topic
} do

  # Acceptance Criteria:
  # [x] User is able to navigate to a search page from any page
  # [x] User is able to enter one or more keywords that search all fields in the database as separate case insensitive keywords
  # [x] User should be taken to a results page that displays all memoirs that match that search
  # [x] User should be given an error message if they submit an empty search

  scenario 'user navigates to a search page' do
    visit root_path

    expect(page.has_selector?("form")).to be(true)
  end

  scenario 'user searches by one keyword' do
    n = Neighborhood.create(name: "Allston") #1
    Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: n.id)
    Memoir.create(name: "Mike", age: 16, memoir: "Life is good. Life is bad.", neighborhood_id: n.id)
    Memoir.create(name: "Anna", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: n.id)
    Memoir.create(name: "Jill", age: 32, memoir: "I slept too much nuff said.", neighborhood_id: n.id)
    Memoir.create(name: "Ruby", age: 16, memoir: "Was greater, learned ruby, became greater.", neighborhood_id: n.id)
    Memoir.create(name: "Cece", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: n.id)

    visit root_path
    fill_in "query", with: "good"
    click_button "Search"
    save_and_open_page

    expect(page).to have_content("Life is good")
  end
end
