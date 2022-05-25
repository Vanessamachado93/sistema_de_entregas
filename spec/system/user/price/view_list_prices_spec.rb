require "rails_helper"

describe "user view carrier price list" do
  it "successfully" do
    company = ShippingCompany.create!(brand_name: "Expresso papaleguas",
                                      corporate_name: "Papaleguas Ltda",
                                      registration_number: "12345678902234",
                                      email_domain: "papaleguas@expresso.com.br",
                                      address: "Rua Joseph, 230", state: "RS",
                                      city: "Canoas")
    user = User.create!(email: "papaleguas@express.com.br", password: "123456",
                        shipping_company: company)

    Price.create!(minimum_weight: 0.10,
                  maximum_weight: 0.50,
                  minimum_cubic_meter: 2,
                  maximum_cubic_meter: 1,
                  price_km: "150", shipping_company: company)

    Price.create!(minimum_weight: 0.200,
                  maximum_weight: 0.200,
                  minimum_cubic_meter: 2,
                  maximum_cubic_meter: 3,
                  price_km: "100", shipping_company: company)

    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"
    click_on "Configuração de preços"

    expect(page).to have_content "Entre 2 a 1 m³ e peso entre 0.1 e 0.5 kgs o valor é de 150 reais por km"
    expect(page).to have_content "Entre 2 a 3 m³ e peso entre 0.2 e 0.2 kgs o valor é de 100 reais por km."
  end
  it "and there are no registered prices" do
    company = ShippingCompany.create!(brand_name: "Expresso papaleguas",
                                      corporate_name: "Papaleguas Ltda",
                                      registration_number: "12345678902234",
                                      email_domain: "papaleguas@expresso.com.br",
                                      address: "Rua Joseph, 230", state: "RS",
                                      city: "Canoas")

    user = User.create!(email: "papaleguas@express.com.br", password: "123456",
                        shipping_company: company)

    login_as user, scope: :user
    visit shipping_company_prices_path(company)

    expect(page).to have_content "Não existem lista de preços"
    expect(page).to have_link "Voltar", href: shipping_company_path(company)
  end

  it "and must be logged in to see the list" do
    company = ShippingCompany.create!(brand_name: "Expresso papaleguas",
                                      corporate_name: "Papaleguas Ltda",
                                      registration_number: "12345678902234",
                                      email_domain: "papaleguas@expresso.com.br",
                                      address: "Rua Joseph, 230", state: "RS",
                                      city: "Canoas")

    visit shipping_company_path(company)
    expect(page).to have_content "Para continuar, efetue login ou registre-se."
  end
end
