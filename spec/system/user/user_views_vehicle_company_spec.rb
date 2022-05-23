require "rails_helper"

describe "User accesses shipping company page" do
  it "and see registered vehicles" do
    company = ShippingCompany.create!(corporate_name: "Expresso H LTDA",
                                      brand_name: "Expresso H",
                                      registration_number: "85748909876540",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "expressoh@express.com.br",
                        password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit shipping_company_path(company)

    click_on "Minha transportadora"
    click_on "Cadastrar veículo"
    fill_in "Marca", with: "Fiat"
    fill_in "Modelo", with: "Doblô"
    fill_in "Placa", with: "XXX1244"
    fill_in "Ano de fabricação", with: "2018"
    fill_in "Capacidade", with: "7000000"
    click_on "Cadastrar"

    expect(page).to have_content "Doblô"
    expect(page).to have_content "Placa: XXX1244"
    expect(page).to have_content "Ano de fabricação: 2018"
    expect(page).to have_content "Marca: Fiat"
    expect(page).to have_content "Capacidade: 7000000g"
  end

  it "and there are no registered vehicles" do
    company = ShippingCompany.create!(corporate_name: "Expresso H LTDA",
                                      brand_name: "Expresso H ",
                                      registration_number: "85748909876540",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    visit "shipping_companies/new#{company.id}"
    expect(page).to have_content "Para continuar, efetue login ou registre-se."
  end
end
