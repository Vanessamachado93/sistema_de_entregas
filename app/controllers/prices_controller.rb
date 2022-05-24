class PricesController < ApplicationController
  def index
    @shipping_company = ShippingCompany.find(params[:shipping_company_id])
    @prices = @shipping_company.prices
  end

  def new
  end

  def show
    @shipping_company = current_user.Shipping_company
  end
end
