class ShippingCompaniesController < ApplicationController
  before_action :authenticate_admin!, only: %i[new index]
  before_action :authenticate_admin_or_user!, only: %i[show]

  def index
    @shipping_companies = ShippingCompany.all
  end

  def show
    @shipping_company = ShippingCompany.find(params[:id])
    @prices = @shipping_company.prices unless @shipping_company.prices.empty?
  end

  def new
    @shipping_company = ShippingCompany.new()
  end

  def create
    @shipping_company = ShippingCompany.new(shipping_company_params)

    if @shipping_company.save
      redirect_to @shipping_company, notice: "Transportadora cadastrada com sucesso."
    else
      flash.now[:alert] = "Transportadora não cadastrada."
      render "new"
    end
  end

  private

  def shipping_company_params
    params.require(:shipping_company).permit(:brand_name, :corporate_name,
                                             :registration_number, :email_domain,
                                             :address, :city, :state)
  end
end
