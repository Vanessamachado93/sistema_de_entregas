require "rails_helper"

describe "Admin see shipping company details" do
  it "from home screen" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R Rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    admin = Admin.create!(email: "email@example.com", password: "123456")

    login_as admin, scope: :admin
    visit root_path
    click_on "Transportadoras"
    click_on "R Rapidão"

    expect(page).to have_content "Transportes Rapidão LTDA"
    expect(page).to have_content "CNPJ: 34567987654567"
    expect(page).to have_content "Endereço: Av João Pedro, 400"
    expect(page).to have_content "Localidade: Porto Alegre - RS"

    expect(page).to have_link("Voltar", href: shipping_companies_path)
  end

  it "must be logged in to view shipping company details" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    visit "shipping_companies/#{company.id}"

    expect(page).to have_content "Para continuar, efetue login ou registre-se."
  end
end
