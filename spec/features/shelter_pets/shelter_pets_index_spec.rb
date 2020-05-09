require 'rails_helper'

RSpec.describe "shelter pets index page" do
  it "displays pets that can be adopted from a shelter" do
    shelter_2 = Shelter.create(name: "Some of the Pets",
                                address: "16 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)

    pet1 = shelter_2.pets.create!( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                        name: "Gerald",
                        age: 62,
                        sex: "Male",
                        shelter_id: shelter_2.id)

    pet2 = shelter_2.pets.create!( image: "https://blog.explore.org/wp-content/uploads/2018/09/fat-bear-blog.jpg",
                        name: "Minnie",
                        age: 4,
                        sex: "Female",
                        shelter_id: shelter_2.id)

    visit "/shelters/#{shelter_2.id}/pets"

    expect(page).to have_content(pet1.name)
    expect(page).to have_content(pet1.age)
    expect(page).to have_content(pet1.sex)
    expect(page).to have_css("image#pet-image-#{pet1.id}")

    expect(page).to have_content(pet2.name)
    expect(page).to have_content(pet2.age)
    expect(page).to have_content(pet2.sex)
    expect(page).to have_css("image#pet-image-#{pet2.id}")
  end 
end

# ```
# [ ] done
#
# User Story 8, Shelter Pets Index
#
# As a visitor
# When I visit '/shelters/:shelter_id/pets'
# Then I see each Pet that can be adopted from that Shelter with that shelter_id including the Pet's:
# - image
# - name
# - approximate age
# - sex
# ```