require 'rails_helper'
RSpec.describe "when visiting a pet show page"do
  it " can delete a pet via a delete link" do
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
    pet2 = shelter_1.pets.create!( image: "https://blog.explore.org/wp-content/uploads/2018/09/fat-bear-blog.jpg",
                        name: "Minnie",
                        age: 4,
                        sex: "Female",
                        shelter_id: shelter_1.id)
    visit "/pets/#{pet1.id}"
    click_link "Delete Pet"
    expect(current_path).to eq("/pets")
    expect(page).to_not have_content("Gerald")
    expect(page).to have_content(pet2.name)
  end
end
