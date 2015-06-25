require 'rails_helper'

feature 'user submits new memoir', %Q{
  As a Bostonian
  I want to submit six word memoirs
  So that I can share my story with people in my city
} do

  # Acceptance Criteria:
  # [x] User is able to navigate to submission page from index page and details page
  # [x] User is able to view form for name, age, neighborhood, and memoirs on 'new memoir' page
  # [x] User is able to successfully submit their memoir to the database
  # [x] User should be redirected to details page for new memoir and see success message if form submitted successfully
  # [x] User should get error message and form should be redisplayed if attempting to submit
  #     invalid or incomplete information

  # let!(:memoir) { Memoir.create!(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: 13) }

  scenario 'user visits new submission page from index page' do
    visit root_path
    click_link 'Submit'

    expect(page.has_selector?("form")).to be(true)
  end

  scenario 'user submits new memoir from the new memoir page' do
    n = Neighborhood.create!(name: "Allston")
    visit new_memoir_path

    fill_in 'Name', with: 'Jill'
    fill_in 'Age', with: '56'
    fill_in 'Memoir', with: 'Was great, learned ruby, became greater.'
    select n.name, from: 'Neighborhood'

    click_button 'Submit'

    expect(page).to have_content('Memoir added.')
    expect(page).to have_content('Was great, learned ruby, became greater')
  end

  scenario 'user submits new memoir with incomplete information' do
    visit root_path
    click_link 'Submit'
    click_button 'Submit'

    expect(page).to have_content('can\'t be blank')
  end

end
