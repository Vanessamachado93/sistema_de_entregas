require "rails_helper"

RSpec.describe Order, type: :model do
  describe "generate a random code" do
    it "when creating a new order" do
      admin = Admin.create!(name: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")

      produto = Product.create!(customer_name: "Lucas", customer_address: "Rua Cardoso, 300 POA - RS",
                                distance: 120, weight: 1000, height: 15, width: 25, depth: 10, sku: "DFR123")

      company = ShippingCompany.create!(corporate_name: "Transportadora Marvel LTDA", brand_name: " Marvel",
                                        registration_number: "90456789000134", email_domain: "marvel@marvel.com.br",
                                        address: "Av do João, 2000", city: "Porto Alegre", state: "RS")

      Vehicle.create!(brand: "FORD", license_plate: "III5588", code_model: "CARGO 1115",
                      manufact_year: "2022", capacity: 500000, shipping_company: company)

      order = Order.new(shipping_company: company, product: produto)

      order.save!
      result = order.code

      expect(result).not_to be_empty
      expect(result.length).to eq 15
    end

    it "and the code is unique" do
      admin = Admin.create!(name: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")

      produto = Product.create!(customer_name: "Lucas", customer_address: "Rua Cardoso, 400 POA - RS",
                                distance: 120, weight: 1000, height: 15, width: 25, depth: 10, sku: "DFR123")

      company = ShippingCompany.create!(corporate_name: "Transportadora Marvel LTDA", brand_name: " Marvel",
                                        registration_number: "90456789000134", email_domain: "m@marvel.com.br",
                                        address: "Av do João, 2000", city: "Porto Alegre", state: "RS")

      Vehicle.create!(brand: "FORD", license_plate: "III1234", code_model: "CARGO 1195",
                      manufact_year: "2020", capacity: 500000, shipping_company: company)

      first_order = Order.create!(shipping_company: company, product: produto)
      second_order = Order.new(shipping_company: company, product: produto)

      second_order.save!
      expect(second_order.code).not_to eq first_order.code
    end
  end
end
