require "rails_helper"

describe "User see vehicle details" do
  it "from home screen" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R Rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    Vehicle.create!(brand: "Ford", license_plate: "IXR7716", code_model: "Cargo 1117", manufact_year: "2021",
                    capacity: 50000, shipping_company: company)

    Vehicle.create!(brand: "Ford", license_plate: "IXX5803", code_model: "Cargo 1844", manufact_year: "2021",
                    capacity: 50000, shipping_company: company)

    user = User.create!(email: "email@example.com", password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"
    click_on "Veículos"
    click_on "Cargo 1117"

    expect(page).to have_content "Ford Cargo 1117"
    expect(page).to have_content "Placa: IXR7716"
    expect(page).to have_content "Capacidade: 50000"
    expect(page).to have_content "Ano de fabricação: 2021"

    expect(page).to have_link("Voltar", href: shipping_company_vehicles_path(company))
  end

  it "must be logged in to view vehicles details" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    ford = Vehicle.create!(brand: "Ford", license_plate: "IXX5803", code_model: "Cargo 1844", manufact_year: "2021",
                           capacity: 50000, shipping_company: company)

    visit shipping_company_vehicle_path(company, ford)

    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
