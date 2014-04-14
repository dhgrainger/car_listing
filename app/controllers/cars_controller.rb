class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
      if @car.save
        redirect_to new_car_path, notice: 'Car was successfully created.'
      else
        render action: 'new', notice: "Missing Attributes"
      end
  end

  def index
    @cars = Car.all
  end

  private
    def car_params
      params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
    end
end
