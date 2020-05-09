'rails_helper'

RSpec.describe "Pet Creation Page", type: :feature do
  it "can create a pet" do
    shelter = Shelter.create({name: "Happy Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578})


    visit "/shelters/#{shelter.id}/pets"
    click_link('Create Pet')
    expect(current_path).to eql("/shelters/#{shelter.id}/pets/new")
    fill_in :image, with: "Fido url"
    fill_in :name, with: "Fido"
    fill_in :description, with: "A loveable cuddley pet"
    fill_in :approximate_age, with: 3
    fill_in :sex, with: "Male"
    click_button("Create Pet")
    expect(current_path).to eql("/shelters/#{shelter.id}/pets")
    expect(page).to have_content("Fido url")
    expect(page).to have_content("Fido")
    expect(page).to have_content("A loveable cuddley pet")
    expect(page).to have_content("Male")
    expect(page).to have_content("adoptable")


  end
end


#
# As a visitor
# When I visit a Shelter Pets Index page
# Then I see a link to add a new adoptable pet for that shelter "Create Pet"
# When I click the link
# I am taken to '/shelters/:shelter_id/pets/new' where I see a form to add a new adoptable pet
# When I fill in the form with the pet's:
# - image
# - name
# - description
# - approximate age
# - sex ('female' or 'male')
# And I click the button "Create Pet"
# Then a `POST` request is sent to '/shelters/:shelter_id/pets',
# a new pet is created for that shelter,
# that pet has a status of 'adoptable',
# and I am redirected to the Shelter Pets Index page where I can see the new pet listed
