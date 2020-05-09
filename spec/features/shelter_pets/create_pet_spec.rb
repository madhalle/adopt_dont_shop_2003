require 'rails_helper'
RSpec.describe "shelter pet creation, shelter pet new, shelter pet index" do
  it "can create a new pet" do
    shelter_1 = Shelter.create(name: "All the Pets",
                                address: "17 Random Rd",
                                city: "Denver",
                                state: "CO",
                                zip: 80113)
    visit "/shelters/#{shelter_1.id}/pets"
    click_on "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets/new")

    fill_in :image, with: "https://pbs.twimg.com/profile_images/758096577428881408/eTqNY_pA_400x400.jpg"
    fill_in :name, with: "Sheila"
    fill_in :description, with: "Sheila likes to unwind with a glass of red"
    fill_in :age, with: 22
    fill_in :sex, with: "Female"


    click_button "Create Pet"
    expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")
    expect(page).to have_content("Sheila")
    new_pet = Pet.last

    expect(new_pet.name).to eq("Sheila")
    expect(new_pet.image).to eq("https://pbs.twimg.com/profile_images/758096577428881408/eTqNY_pA_400x400.jpg")
    expect(new_pet.description).to eq("Sheila likes to unwind with a glass of red")
    expect(new_pet.age).to eq(22)
    expect(new_pet.sex).to eq("Female")
    expect(new_pet.adoption_status).to eq("adoptable")

  end
end



# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
# ```
