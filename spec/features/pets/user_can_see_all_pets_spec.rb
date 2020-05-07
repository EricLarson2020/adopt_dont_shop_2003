require 'rails helper'

RSpec.describe "Pet Index Page", type: :feature do
  it "Can See All Pets" do

    shelter_1 = Shelter.create(name: "Happy Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578)

   shelter_2 = Shelter.create(name: "Doggy Haven",
                            address: "22222 Haven Street",
                            city: "Doggy Vale",
                            state: "California",
                            zip: 86192)

    pet_1 = Pet.create({
      image: "https://images.pexels.com/photos/160846/french-bulldog-summer-smile-joy-160846.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      name: "Sparky",
      approximate_age: 5,
      sex: "Male"
      shelter: "Happy Shelter"
      })

    pet_2 = Pet.create({
      image: "https://images.pexels.com/photos/551628/pexels-photo-551628.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
      name: "Silly",
      approximate_age: 2,
      sex: "Female",
      shelter: "Doggy Haven"
      })


  visit "/pets"
  expect(page).to have_content(pet_1.image)
  expect(page).to have_content(pet_1.name)
  expect(page).to have_content(pet_1.approximate_age)
  expect(page).to have_content(pet_1.shelter)
  expect(page).to have_content(pet_1.sex)
  expect(page).to have_content(pet_2.image)
  expect(page).to have_content(pet_2.name)
  expect(page).to have_content(pet_2.approximate_age)
  expect(page).to have_content(pet_2.sex)
  expect(page).to have_content(pet_2.shelter)
  # As a visitor
  # When I visit '/pets'
  # Then I see each Pet in the system including the Pet's:
  # - image
  # - name
  # - approximate age
  # - sex
  # - name of the shelter where the pet is currently located
