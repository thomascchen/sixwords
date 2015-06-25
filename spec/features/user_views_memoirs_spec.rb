require 'rails_helper'

feature 'user views new memoir', %Q{
  As a Bostonian
  I want to see a list of memoirs
  So that I can discover the stories of people in my city
} do

  # Acceptance Criteria:
  # [x] User is able to navigate to index page see list of memoirs
  # [x] User sees six random memoirs on the index page
  # [x] User should see a different set of six memoirs each time they navigate to the index page

  scenario 'user visits index page' do
  n = Neighborhood.create(name: "Allston")

    Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: n.id)
    Memoir.create(name: "Mike", age: 16, memoir: "Life is good. Life is bad.", neighborhood_id: n.id)
    Memoir.create(name: "Anna", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: n.id)
    Memoir.create(name: "Jill", age: 32, memoir: "I slept too much nuff said.", neighborhood_id: n.id)
    Memoir.create(name: "Ruby", age: 16, memoir: "Was greater, learned ruby, became greater.", neighborhood_id: n.id)
    Memoir.create(name: "Cece", age: 72, memoir: "I had it pretty good. Yup.", neighborhood_id: n.id)
    Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered.", neighborhood_id: n.id)

    visit root_path

    expect(page.has_xpath?('.//p', count: 6)).to be(true)
    expect(page)
  end
end
