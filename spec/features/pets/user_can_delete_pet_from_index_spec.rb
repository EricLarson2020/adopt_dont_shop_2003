require 'rails_helper'

RSpec.describe "Shelter Index Page", type: :feature do
  it "can delete pet from index page" do


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
