require 'rails_helper'

RSpec.describe "shelter show page" do
  it "can update shelter" do

    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters/#{shelter_1.id}"
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    fill_in :name, with: "No Longer All the Pets"

    click_button "Submit"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end

  it "can get to pet index from new page" do
    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters/#{shelter_1.id}/edit"

    click_link "Pet Index"
    expect(current_path).to eq("/pets")
  end
end
