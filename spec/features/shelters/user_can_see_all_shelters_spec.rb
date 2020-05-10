require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see shelter name" do
    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters"

    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end

  it "can edit shelter from index page" do
    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters"
    click_link "Edit #{shelter_1.name}"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")

    fill_in :name, with:"Allll the pets"
    click_button "Submit"
    visit "/shelters"
    expect(page).to have_content("Allll the pets")
    expect(page).to have_content(shelter_2.name)

  end
  it "can delete shelter from index page" do
    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters"
    click_link "Delete #{shelter_1.name}"
    expect(current_path).to eq("/shelters")

    expect(page).to_not have_content("All the Pets")
    expect(page).to have_content(shelter_2.name)

  end

  it "can get to pet index" do
  
    visit "/shelters"

    click_link "Pet Index"
    expect(current_path).to eq("/pets")
  end
end
