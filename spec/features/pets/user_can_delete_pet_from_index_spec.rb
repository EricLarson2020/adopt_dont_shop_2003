require 'rails_helper'

RSpec.describe "Shelter Index Page", type: :feature do
  it "can delete pet from index page" do

    shelter_1 = Shelter.create({name: "Mildias Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578})

    pet = Pet.create({
      image: "Cloudy Url",
      name: "Cloudy",
      approximate_age: 41,
      sex: "Female",
      shelter_id: shelter_1.id
      })

   visit '/pets'
   click_link("Delete Pet #{pet.id}")
   expect(current_path).to eql('/pets')
   expect(page).not_to have_content(pet.image)
   expect(page).not_to have_content(pet.name)
   expect(page).not_to have_content(pet.approximate_age)
 end
end
