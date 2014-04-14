require 'spec_helper'

feature 'User can associate a car with a manufacturer', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do


  context 'I can create a car with a manufacturer' do
    it 'asigns a car to a manufacturer' do

      chevy = FactoryGirl.create(:manufacturer)

      visit '/cars/new'

      fill_in "Color", with: "Red"
      fill_in "Mileage", with: "100000"
      select  1984, from: "Year"
      fill_in "Description", with: "corvette"
      select chevy.name, from: "Manufacturer"

      click_on "Create Car"
      click_on "Cars"

      expect(page).to have_content("Red")
      expect(page).to have_content("100000")
      expect(page).to have_content("1984")
      expect(page).to have_content("corvette")
      expect(page).to have_content(chevy.name)
      expect(Car.first.manufacturer.name).to eql(chevy.name)

    end

    it 'can destroy a manufacturer without destroying the related car' do

      chevy = FactoryGirl.create(:manufacturer)

      visit '/cars/new'

      fill_in "Color", with: "Red"
      fill_in "Mileage", with: "100000"
      select  1984, from: "Year"
      fill_in "Description", with: "corvette"
      select chevy.name, from: "Manufacturer"

      click_on "Create Car"

      visit manufacturers_path

      count = Manufacturer.count
      carCount = Car.count

      click_on "Destroy"

      expect(Manufacturer.count).to eql(count-1)
      expect(Car.count).to eql(carCount)

    end
  end


end
