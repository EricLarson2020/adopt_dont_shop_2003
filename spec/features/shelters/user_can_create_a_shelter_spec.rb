require 'rails_helper'

RSpec.describe "shelter create page", type: :feature do
  it "can create shelters" do
    shelter = Shelter.create(name: "Dog Shelter",
                             address: "12980 Grover Drive",
                             city: "Doggy Vale",
                             state: "Colorado",
                             zip: 74578)

    visit "/shelters"
    click_link('New Shelter')
    expect(current_path).to_eql('/shelters.new')
    fill_in :name, with: "Dog Shelter"
    fill_in :address, with: "12980 Grover Drive"
    fill_in :city, with: "Doggy Vale"
    fill_in :state, with: "Colorado"
    fill_in :zip, with: 74578
    click_on 'submit'
    expect(current_path).to have_content('/shelters')
    expect(current_path).to have_content('Dog Shelter')
    expect(current_path).to have_content('2980 Grover Drive')
    expect(current_path).to have_content('Doggy Vale')
    expect(current_path).to have_content('Colorado')
    expect(current_path).to have_content(74578)
  end
end
