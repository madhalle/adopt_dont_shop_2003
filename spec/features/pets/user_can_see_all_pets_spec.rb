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
      save_and_open_page
      expect(page).to have_content(pet1.name)
      expect(page).to have_css("image#pet-image-#{pet1.id}")
      # expect(page).to have_css("#pet-image-#{pet1.id}")
      expect(page).to have_content(pet1.age)
      expect(page).to have_content(pet1.sex)
      expect(page).to have_content("#{pet1.shelter_id}")

      expect(page).to have_css("#pet-image-#{pet2.id}")
      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet2.age)
      expect(page).to have_content(pet2.sex)
      expect(page).to have_content("#{pet2.shelter_id}")
    end
end


# Then I see each Pet in the system including the Pet's:
# - image
# - name
# - approximate age
# - sex
# - name of the shelter where the pet is currently located
