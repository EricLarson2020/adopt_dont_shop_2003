require 'rails_helper'

RSpec.describe "shelter delete page", type: :feature do
  it "can delete shelters" do
    shelter = Shelter.create(name: "Dog Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578)

  visit("/shelters/#{shelter.id}")
  expect(page).to have_content(shelter.name)
  click_link('Delete Shelter')
  expect(current_path).to_not have_content("/shelters/#{shelter.id}")
  expect(current_path).to have_content("/shelters")
  expect(page).not_to have_content(shelter.name)
  expect(page).not_to have_content(shelter.address)
  expect(page).not_to have_content(shelter.city)
  expect(page).not_to have_content(shelter.state)
  expect(page).not_to have_content(shelter.zip)
end
end
