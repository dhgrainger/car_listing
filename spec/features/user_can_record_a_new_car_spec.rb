require 'spec_helper'

feature 'User can create a new car', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

 before(:each) do
    visit '/cars/new'
  end

context 'a car is entered with valid attributes' do
    it 'create a car with valid attributes' do
      car = FactoryGirl.create(:car)

      fill_in "Color", with: car.color
      fill_in "Mileage", with: car.mileage
      select  car.year, from: "Year"
      fill_in "Description", with: car.description

      click_on "Create Car"
      click_on "Cars"
      expect(page).to have_content(car.color)
      expect(page).to have_content(car.mileage)
      expect(page).to have_content(car.year)
      expect(page).to have_content(car.description)

    end
  end

  context 'a car is entered with invalid attributes' do
    it 'creates a car with invalid attributes' do

      click_on "Create Car"

      expect(page).to have_content("Colorcan't be blank")
      expect(page).to have_content("2014can't be blank")
      expect(page).to have_content("Mileagecan't be blank")
    end
  end
end
