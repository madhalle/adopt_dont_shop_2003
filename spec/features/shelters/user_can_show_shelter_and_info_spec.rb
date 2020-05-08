require 'rails_helper'
RSpec.describe "shelter id page", type: :feature do
  it "can see shelter name and all its info" do
    shelter_1 = Shelter.create!(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create!(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)
    visit "/shelters/#{shelter_1.id}"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_1.address)
    expect(page).to have_content(shelter_1.city)
    expect(page).to have_content(shelter_1.state)
    expect(page).to have_content(shelter_1.zip)

    visit "/shelters/#{shelter_2.id}"
    expect(page).to have_content(shelter_2.name)
    expect(page).to have_content(shelter_2.address)
    expect(page).to have_content(shelter_2.city)
    expect(page).to have_content(shelter_2.state)
    expect(page).to have_content(shelter_2.zip)
  end
end
