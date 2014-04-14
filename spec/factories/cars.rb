# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :car do
    color "Yellow"
    year 1984
    mileage 100000
    description "Corvette"
    manufacturer
  end
end
