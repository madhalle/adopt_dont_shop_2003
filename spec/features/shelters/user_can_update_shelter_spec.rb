require 'rails_helper'

RSpec.describe "shelter show page" do
  it "can update shelter" do

    shelter_1 = Shelter.create(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters/#{shelter_1.id}"
    click_link "Update Shelter"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/edit")
    fill_in :name, with: "No Longer All the Pets"
    # fill_in :address, with:
    # fill_in :city, with:
    # fill_in :state, with:
    # fill_in :zip, with:
    click_button "Submit"
    expect(current_path).to eq("/shelters/#{shelter_1.id}")
  end
end


# User Story 5, Shelter Update

# - name
# - address
# - city
# - state
# - zip
# When I fill out the form with updated information
# And I click the button to submit the form
# Then a `PATCH` request is sent to '/shelters/:id',
# the shelter's info is updated,
# and I am redirected to the Shelter's Show page where I see the shelter's updated info
