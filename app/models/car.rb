class Car < ActiveRecord::Base

  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true
  belongs_to :manufacturer

  YEARS = (1980..2014)

end
