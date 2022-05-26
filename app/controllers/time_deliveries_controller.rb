class TimeDeliveriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :set_shipping_company

  def index
    @time_deliveries = @shipping_company.time_deliveries
  end

  def new
    @time_delivery = @shipping_company.time_deliveries.new
  end

  def create
    @time_delivery = @shipping_company.time_deliveries.new(time_delivery_params)
    if @time_delivery.save
      redirect_to new_shipping_company_time_delivery_path(@shipping_company), notice: "Prazo cadastrado com sucesso."
    else
      flash.now[:alert] = "Prazo não cadastrado."
      render "new"
    end
  end

  private

  def time_delivery_params
    params.require(:time_delivery).permit(:min_distance,
                                          :max_distance,
                                          :time)
  end

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end
end
