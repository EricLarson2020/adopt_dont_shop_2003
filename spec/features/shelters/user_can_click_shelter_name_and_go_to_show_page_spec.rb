require 'rails_helper'

RSpec.describe "Shelter Index Page", type: :feature do
  it "Can click on name of shelter and go to shelter show page" do

    shelter = Shelter.create(name: "Fido Shelter",
                             address: "12888 Grover Drive",
                             city: "Dody Vale",
                             state: "Dog Twon",
                             zip: 74599)

    visit '/shelters'
    click_link(shelter.name)
    expect(page).to have_content(shelter.name)
    expect(page).to have_content(shelter.address)
    expect(page).to have_content(shelter.city)
    expect(page).to have_content(shelter.state)
    expect(page).to have_content(shelter.zip)
  end
end                   
