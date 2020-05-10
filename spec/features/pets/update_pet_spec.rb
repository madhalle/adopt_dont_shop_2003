require 'rails_helper'
RSpec.describe "when visiting pet show page" do
  it "can update pet info via edit form" do
    shelter_1 = Shelter.create(name: "All the Pets",
                                address: "17 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)

    pet1 = shelter_1.pets.create( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                        name: "Gerald",
                        age: 62,
                        sex: "Male",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet1.id}"
    click_link "Update Pet"
    expect(current_path).to eq("/pets/#{pet1.id}/edit")


    fill_in :name, with: "Gerald the 2nd"

    click_button "Submit"
    expect(current_path).to eq("/pets/#{pet1.id}")
    expect(page).to have_content(pet1.name)
  end
  it "can get to pet index" do
    shelter_1 = Shelter.create(name: "All the Pets",
                                address: "17 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)

    pet1 = shelter_1.pets.create( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                        name: "Gerald",
                        age: 62,
                        sex: "Male",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet1.id}"

    click_link "Pet Index"
    expect(current_path).to eq("/pets")
  end
  it "can get to pet index" do
    shelter_1 = Shelter.create(name: "All the Pets",
                                address: "17 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)

    pet1 = shelter_1.pets.create( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                        name: "Gerald",
                        age: 62,
                        sex: "Male",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet1.id}"

    click_link "Shelter Index"
    expect(current_path).to eq("/shelters")
  end
end

# As a visitor
# When I visit a Pet Show page
# Then I see a link to update that Pet "Update Pet"
# When I click the link
# I am taken to '/pets/:id/edit' where I see a form to edit the pet's data including:
# - image
# - name
# - description
# - approximate age
# - sex
# When I click the button to submit the form "Update Pet"
# Then a `PATCH` request is sent to '/pets/:id',
# the pet's data is updated,
# and I am redirected to the Pet Show page where I see the Pet's updated information
# ```
