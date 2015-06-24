require 'rails_helper'

RSpec.describe Neighborhood, type: :model do

  it 'has a name' do
    neighborhood = Neighborhood.create(name: "Jamaica Plain")

    expect(neighborhood.name).to eq("Jamaica Plain")
  end
end
