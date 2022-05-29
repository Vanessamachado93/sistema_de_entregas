require "rails_helper"

describe "Admin see details order list" do
  it "and you should not see the accept and decline order buttons" do
    company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA", brand_name: "R Rapião",
                                      registration_number: "34567987654567", email_domain: "saomiguel.com.br",
                                      address: "Av do João, 1000", city: "Porto Alegre", state: "RS")

    product = Product.create!(customer_name: "Pedro Silva", customer_address: "Av. Santos, 890 POA - RS",
                              distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "DFG456")

    admin = Admin.create!(name: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")

    order = Order.create!(shipping_company: company, product: product)

    login_as admin, scope: :admin
    visit order_path(order)

    expect(page).not_to have_button "Aceitar Ordem de Serviço"
    expect(page).not_to have_button "Recusar Ordem de Serviço"
  end
end
