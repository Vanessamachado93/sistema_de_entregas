class VehiclesController < ApplicationController
  before_action :set_shipping_company

  def new
    @vehicle = @shipping_company.vehicles.new
  end

  def create
    @vehicle = @shipping_company.vehicles.new(vehicle_params)
    if @vehicle.save
      redirect_to [@shipping_company, @vehicle], notice: "Veículo cadastrado com sucesso"
    else
      flash.now[:alert] = "Não foi possível cadastrar o veículo."
      render :new
    end
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:license_plate,
                                    :brand, :code_model,
                                    :manufact_year, :capacity)
  end

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end
end
