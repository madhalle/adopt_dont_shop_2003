require 'rails_helper'

RSpec.describe "shelters index page", type: :feature do
  it "can see shelter name" do
    shelter_1 = Shelter.create(name: "All the Pets")
    shelter_2 = Shelter.create(name: "Some of the Pets")

    visit "/shelters"
    expect(page).to have_content(shelter_1.name)
    expect(page).to have_content(shelter_2.name)
  end
end
