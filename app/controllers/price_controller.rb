class PriceController < ApplicationController
  def show
    @shipping_company = current_user.Shipping_company
  end
end
