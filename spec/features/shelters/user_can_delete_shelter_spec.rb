require 'rails_helper'
RSpec.describe "shelter show page" do
  it "can delete a shelter" do
    shelter_1 = Shelter.create!(name: "All the Pets", address: "17 Random Rd", city: "Denver", state: "CO", zip: 80113)
    shelter_2 = Shelter.create!(name: "Some of the Pets", address: "16 Random Rd", city: "Denver", state: "CO", zip: 80113)

    visit "/shelters/#{shelter_1.id}"

    click_link "Delete Shelter"
    expect(current_path).to eq("/shelters")
    expect(page).to have_content(shelter_2.name)
    expect(page).to_not have_content(shelter_1.name)
  end
end

# [ ] done
#
# User Story 6, Shelter Delete
#
# As a visitor
# When I visit a shelter show page
# Then I see a link to delete the shelter
# When I click the link "Delete Shelter"
# Then a 'DELETE' request is sent to '/shelters/:id',
# the shelter is deleted,
# and I am redirected to the shelter index page
# where I no longer see this shelter
