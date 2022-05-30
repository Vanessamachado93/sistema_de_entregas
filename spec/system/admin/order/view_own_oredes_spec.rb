require "rails_helper"

describe "Admin sees their own orders" do
  it "and must be authenticated" do
    admin = Admin.create!(email: "admin@sistemadeentregas.com.br", password: "123456")
    login_as(admin)
    visit root_path
    click_on "Lista de Ordens"

    expect(page).to have_content "Lista de Ordens"
  end
  it "and don't see other requests" do
    company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA", brand_name: "R Rapião",
                                      registration_number: "34567987654567", email_domain: "saomiguel.com.br",
                                      address: "Av do João, 1000", city: "Porto Alegre", state: "RS")

    product = Product.create!(customer_name: "Carolina", customer_address: "Av. Ipiranga, 2900 POA - RS",
                              distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "ASD456")
    vehicle = Vehicle.create!(brand: "FORD", license_plate: "IBM7803", code_model: "CARGO 1144", manufact_year: "2021",
                              capacity: 7000000, shipping_company: company)

    admin = Admin.create!(name: "Carolina", email: "admin@sistemadefrete.com.br", password: "123456")

    order = Order.create!(shipping_company: company, product: product)
    login_as(admin)
    visit root_path
    click_on "Lista de Ordens"
    expect(page).to have_content order.code
  end
end
