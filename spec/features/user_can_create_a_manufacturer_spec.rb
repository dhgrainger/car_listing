require 'spec_helper'

feature 'User can create a manufacturer', %q{
  As a car salesperson
  I want to record a car manufacturer
  So that I can keep track of the types of cars found in the lot
} do

 before(:each) do
    visit '/manufacturers/new'
  end

context 'a car is entered with valid attributes' do
    it 'create a car with valid attributes' do
      chevy = FactoryGirl.create(:manufacturer)

      fill_in "Name", with: chevy.name
      fill_in "Nation", with: chevy.nation

      click_on "Create Manufacturer"
      click_on "Manufacturers"
      expect(page).to have_content(chevy.name)
      expect(page).to have_content(chevy.nation)

    end
  end

  context 'a manufacturer is entered with invalid attributes' do
    it 'creates a manufacturer with invalid attributes' do

      click_on "Create Manufacturer"

      expect(page).to have_content("Namecan't be blank")
      expect(page).to have_content("Nationcan't be blank")
    end
  end
end
