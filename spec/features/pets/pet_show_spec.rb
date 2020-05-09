require 'rails_helper'

RSpec.describe "pet show page" do
  it "displays image, name, description, age, sex, adoptable status" do
    shelter_1 = Shelter.create(name: "All the Pets",
                                address: "17 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)

    pet1 = shelter_1.pets.create!( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                        name: "Gerald",
                        age: 62,
                        sex: "Male",
                        shelter_id: shelter_1.id,
                        description: "Loves long walks on the beach",
                        adoption_status: "adoptable")

    visit "/pets/#{pet1.id}"
    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_content(pet1.description)
    expect(page).to have_content(pet1.adoption_status)
    expect(page).to have_css("img[src*='#{pet1.image}']")
  end
end


#
# ```
# [ ] done
#
# User Story 9, Pet Show
#
# As a visitor
# When I visit '/pets/:id'
# Then I see the pet with that id including the pet's:
# - image
# - name
# - description
# - approximate age
# - sex
# - adoptable/pending adoption status
# ```
