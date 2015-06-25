require 'rails_helper'

feature 'user views new memoir', %Q{
  As a Bostonian
  I want to search for memoirs by neighborhood
  So that I can discover the stories of people in my neighborhood
} do

  # Axceptance Criteria:
  # [x] User is able to navigate to a neighborhoods page
  # [x] User is able to click each neighborhood link and be taken to a list of memoirs for that neighborhood
  # [x] If there are no memoirs yet for that neighborhood, they should receive an error message and the neighborhoods page should re-render

  scenario 'user visits neighborhoods page' do
    n1 = Neighborhood.create(name: "Allston")
    n2 = Neighborhood.create(name: "Back Bay")
    n3 = Neighborhood.create(name: "Bay Village")

    visit neighborhoods_path

    expect(page).to have_content(n1.name)
    expect(page).to have_content(n2.name)
    expect(page).to have_content(n3.name)
  end

  scenario 'user visits neighborhood show page for which there are no memoirs' do
    n1 = Neighborhood.create(name: "Allston")
    n2 = Neighborhood.create(name: "Back Bay")
    n3 = Neighborhood.create(name: "Bay Village")

    Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: n1.id)
    Memoir.create(name: "Mike", age: 16, memoir: "Life is good. Life is bad.", neighborhood_id: n2.id)

    visit neighborhoods_path
    click_link n3.name

    expect(page).to have_content("Neighborhoods")
    expect(page).to have_content("No memoirs for that neighborhood yet")
  end
end
