class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :nation, presence: true

  has_many :cars, dependent: :nullify
end
