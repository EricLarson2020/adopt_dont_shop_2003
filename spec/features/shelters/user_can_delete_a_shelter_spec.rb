require 'rails_helper'

RSpec.describe "shelter delete page", type: :feature do
  it "can delete shelters" do
    shelter = Shelter.create(name: "Dog Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578)

  visit("/shelters/#{shelter.id}")
  
