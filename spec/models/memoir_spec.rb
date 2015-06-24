require 'rails_helper'

RSpec.describe Memoir, type: :model do

  it 'has a name, age, memoir, and neighborhood' do
    neighborhood = Neighborhood.create(name: "Jamaica Plain")
    memoir = Memoir.create(name: "Tom", age: 32, memoir: "I came I coded I conquered", neighborhood_id: neighborhood.id)

    expect(memoir.name).to eq("Tom")
    expect(memoir.age).to eq(32)
    expect(memoir.memoir).to eq("I came I coded I conquered")
    expect(memoir.neighborhood.name).to eq("Jamaica Plain")
  end
end
