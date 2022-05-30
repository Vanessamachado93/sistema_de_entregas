class OrdersController < ApplicationController
  def index
  end

  def new
    @order = Order.new
    @shipping_companies = ShippingCompany.all
    @products = Product.all
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Ordem de serviço cadastrada com sucesso"
    end
  end

  def show
    @order = Order.find(params[:id])
  end

  def search
    @code = params["query"]

    @order = Order.find_by(code: params["query"])
  end

  private

  def order_params
    params.require(:order).permit(:shipping_company_id, :product_id, :status, :code)
  end
end
