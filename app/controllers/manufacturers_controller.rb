class ManufacturersController < ApplicationController
  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      redirect_to new_manufacturer_path, notice: 'Manufacturer was successfully created.'
    else
      render action: 'new', notice: "Missing Attributes"
    end
  end

  def index
    @manufacturers = Manufacturer.all
  end

  def destroy
    @manufacturer = Manufacturer.find(params['id'])
    @manufacturer.destroy
    render action: 'new'
  end

  private
    def manufacturer_params
      params.require(:manufacturer).permit(:name, :nation)
    end
end
