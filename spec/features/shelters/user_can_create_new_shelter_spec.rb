require 'rails_helper'

RSpec.describe "shelter new page", type: :feature do
  it "can create a new shelter " do
    visit "/shelters"
    click_on "New Shelter"
    expect(current_path).to eq("/shelters/new")

    fill_in :name, with: "Super New Shelter"
    fill_in :address, with: "17 random rd"
    fill_in :city, with: "Denver"
    fill_in :state, with: "CO"
    fill_in :zip, with: 80113

    click_button "Create Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content("Super New Shelter")
    new_shelter = Shelter.last

    expect(new_shelter.name).to eq("Super New Shelter")
    expect(new_shelter.address).to eq("17 random rd")
    expect(new_shelter.city).to eq("Denver")
    expect(new_shelter.state).to eq("CO")
    expect(new_shelter.zip).to eq(80113)
  end

  it "can get to pet index from new page" do

    visit "/shelters/new"

    click_link "Pet Index"
    expect(current_path).to eq("/pets")
  end

end
