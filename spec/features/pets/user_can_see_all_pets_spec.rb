require 'rails_helper'
RSpec.describe "pet index page" do
  it "can view all pets in system" do
      shelter_1 = Shelter.create(name: "All the Pets",
                                  address: "17 Random Rd",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80113)
      shelter_2 = Shelter.create(name: "Some of the Pets",
                                  address: "16 Random Rd",
                                  city: "Denver",
                                  state: "CO",
                                  zip: 80113)

      pet1 = shelter_1.pets.create!( image: "https://i.redd.it/ilfdwwjo9zs11.png",
                          name: "Gerald",
                          age: 62,
                          sex: "Male",
                          shelter_id: shelter_1.id)

      pet2 = shelter_2.pets.create!( image: "https://blog.explore.org/wp-content/uploads/2018/09/fat-bear-blog.jpg",
                          name: "Minnie",
                          age: 4,
                          sex: "Female",
                          shelter_id: shelter_2.id)

      visit "/pets"

      expect(page).to have_content(pet1.name)
      expect(page).to have_css("img[src*='#{pet1.image}']")
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content("#{pet1.shelter_id}")

      expect(page).to have_css("img[src*='#{pet2.image}']")
      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_content("#{pet2.shelter_id}")
  end

  it "can edit pet from index page" do
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
    visit "/pets"
    click_link "Edit #{pet1.name}"
    expect(current_path).to eq("/pets/#{pet1.id}/edit")

    fill_in :name, with:"Gerald the 4th"
    click_button "Submit"
    visit "/pets"
    expect(page).to have_content("Gerald the 4th")

  end
end


# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
