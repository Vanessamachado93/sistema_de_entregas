require "rails_helper"
describe "Admin searches for an order" do
  it "from home page" do
    admin = Admin.create!(email: "admin@sistemadefrete.com", password: "123456")
    login_as(admin)
    visit root_path

    expect(page).to have_field("RASTREAR ORDEM:")
    expect(page).to have_button("BUSCAR")
  end
  it "visitor can search without being authenticated" do
    visit root_path

    expect(page).to have_field("RASTREAR ORDEM:")
    expect(page).to have_button("BUSCAR")
  end

  it "and find an order" do
    company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA", brand_name: "R Rapião",
                                      registration_number: "34567987654567", email_domain: "saomiguel.com.br",
                                      address: "Av do João, 1000", city: "Porto Alegre", state: "RS")

    product = Product.create!(customer_name: "Ana", customer_address: "Av. Ipiranga, 1234 POA - RS",
                              distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "QWE456")
    vehicle = Vehicle.create!(brand: "FORD", license_plate: "IXX5803", code_model: "CARGO 1844", manufact_year: "2021",
                              capacity: 7000000, shipping_company: company)

    admin = Admin.create!(name: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")

    order = Order.create!(shipping_company: company, product: product)
    login_as(admin)
    visit root_path
    fill_in "RASTREAR ORDEM:", with: order.code
    click_on "BUSCAR"

    expect(page).to have_content "Resultado da Busca por: #{order.code}"
    expect(page).to have_content "1 ordem encontrado"
    expect(page).to have_content "ORDEM: #{order.code}"
    expect(page).to have_content "Destinátario: Ana"
    expect(page).to have_content "Endereço de Entrega: Av. Ipiranga, 1234 POA - RS"
    expect(page).to have_content "Transportadora: Transportadora R rapidão LTDA"
  end
end
