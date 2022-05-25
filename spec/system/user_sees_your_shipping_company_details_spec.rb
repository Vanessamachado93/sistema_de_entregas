require "rails_helper"

describe "user see shipping company details" do
  it "from home screen" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R Rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    user = User.create!(email: "email@example.com", password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"

    expect(page).to have_content "Transportadora R Rapidão"
    expect(page).to have_content "CNPJ: 34567987654567"
    expect(page).to have_content "Endereço: Av João Pedro, 400"
    expect(page).to have_content "Localidade: Porto Alegre - RS"
    expect(page).to have_link "Voltar", href: root_path
    expect(page).to have_link "Veículos", href: shipping_company_vehicles_path(company)
    expect(page).to have_link "Configuração de preços", href: shipping_company_prices_path(company)
  end
end
