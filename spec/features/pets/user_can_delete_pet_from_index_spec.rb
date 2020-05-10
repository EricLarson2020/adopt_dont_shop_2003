require 'rails_helper'

RSpec.describe "Shelter Index Page", type: :feature do
  it "can delete pet from index page" do

    shelter_1 = Shelter.create({name: "Happy Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578})

    pet = Pet.create({
      image: "Happy Url",
      name: "Raulgh",
      approximate_age: 2,
      sex: "Male",
      shelter_id: shelter_1.id
      })

   visit '/pets'
   click_link("Delete Pet #{pet.id}")
   expect(current_path).to eql('/pets')
 end
end
