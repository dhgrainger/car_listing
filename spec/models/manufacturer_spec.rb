require 'spec_helper'

describe Manufacturer do
  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:nation)}

  it {should have_many(:cars)}
end
