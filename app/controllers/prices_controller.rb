class PricesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new]
  before_action :set_shipping_company

  def index
    @prices = @shipping_company.prices
  end

  def new
    @price = @shipping_company.prices.new
  end

  def create
    @price = @shipping_company.prices.new(price_params)
    if @price.save
      redirect_to shipping_company_prices_path(@shipping_company), notice: "Preço cadastrado com sucesso"
    else
      flash.now[:alert] = "Não foi possível cadastrar o preço."
      render :new
    end
  end

  private

  def price_params
    params.require(:price).permit(:maximum_weight,
                                  :minimum_weight,
                                  :maximum_cubic_meter,
                                  :minimum_cubic_meter,
                                  :price_km)
  end

  def set_shipping_company
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
  end
end
