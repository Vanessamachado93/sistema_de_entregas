require "rails_helper"

describe "Admin registered work order" do
  it "sucessfully" do
    company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA",
                                      brand_name: "R Rapião", registration_number: "34567987654567",
                                      email_domain: "saomiguel.com.br", address: "Av do João, 1000", city: "Porto Alegre",
                                      state: "RS")

    ShippingCompany.create!(corporate_name: "Transportadora Marvel LTDA", brand_name: " Marvel",
                            registration_number: "90456789000134", email_domain: "marvel@marvel.com.br",
                            address: "Av do João, 2000", city: "Porto Alegre", state: "RS")

    ford = Vehicle.create!(brand: "Ford", license_plate: "IXR7716", code_model: "Cargo 1117",
                           manufact_year: "2021", capacity: 50000, shipping_company: company)

    Vehicle.create!(brand: "Ford", license_plate: "III5566", code_model: "Cargo 0001",
                    manufact_year: "2018", capacity: 50000, shipping_company: company)

    Price.create!(minimum_weight: 0.10, maximum_weight: 0.50,
                  minimum_cubic_meter: 2, maximum_cubic_meter: 1,
                  price_km: "150", shipping_company: company)

    product = Product.create!(customer_name: "Pedro", customer_address: "Av. Santos, 890 POA - RS",
                              distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "DFG456")

    product_1 = Product.create!(customer_name: "Maria", customer_address: "Av. Andradas, 499 POA - RS",
                                distance: 120, weight: 1023, height: 15, width: 25, depth: 8, sku: "ABC123")

    admin = Admin.create!(name: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")

    login_as admin, scope: :admin
    visit shipping_companies_path
    click_on "Registrar Ordem de Serviço"

    select "Transportadora R rapidão LTDA", from: "Transportadora"
    select "DFG456", from: "Produto"
    click_on "Cadastrar"

    expect(page).to have_content "Ordem de serviço cadastrada com sucesso"
  end
end
