require 'rails helper'

RSpec.describe "shelter create page", :type :feature do
  it "can create shelters" do
    shelter = Shelter.create(name: "Dog Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578)

    

  end
