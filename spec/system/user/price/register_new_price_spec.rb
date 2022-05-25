require "rails_helper"

describe "User registers a new price" do
  it "successfully" do
    company = ShippingCompany.create!(corporate_name: "Expresso X LTDA",
                                      brand_name: "Expresso X ",
                                      registration_number: "85748909876545",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "expressox@express.com.br", password: "123456",
                        shipping_company: company)

    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"
    click_on "Configuração de preços"
    click_on "Cadastrar preço"
    fill_in "Peso mínimo", with: "0"
    fill_in "Peso maximo", with: "10"
    fill_in "Minímo m³", with: "0.0001"
    fill_in "Máximo m³", with: "0.500"
    fill_in "Valor por Km", with: "0.75"
    click_on "Cadastrar"

    expect(current_path).to eq shipping_company_prices_path(company)

    expect(page).to have_content "Entre 0 a 0 m³ e peso entre 0.0 e 10.0 kgs o valor é de 0 reais por km."
  end

  it "with incomplete data" do
    company = ShippingCompany.create!(corporate_name: "Expresso y LTDA",
                                      brand_name: "Expresso y ",
                                      registration_number: "73628193800013",
                                      email_domain: "expressoy.com.br",
                                      address: "Rua do Pedro, 3000",
                                      city: "Novo Hamburgo",
                                      state: "RS")
    user = User.create!(email: "empressoy@expressoy.com.br", password: "123456",
                        shipping_company: company)
    login_as user, scope: :user
    visit new_shipping_company_price_path(company)
    fill_in "Peso mínimo", with: ""
    fill_in "Peso maximo", with: ""
    fill_in "Minímo m³", with: ""
    fill_in "Máximo m³", with: ""
    fill_in "Valor por Km", with: ""
    click_on "Cadastrar"

    expect(page).to have_content "não pode ficar em branco", count: 5
    expect(page).to have_content "Não foi possível cadastrar o preço."
    expect(page).to have_link "Voltar", href: shipping_company_prices_path(company)
  end

  it "and you need to be logged in" do
    company = ShippingCompany.create!(corporate_name: "Expresso y LTDA",
                                      brand_name: "Expresso y ",
                                      registration_number: "73628193800013",
                                      email_domain: "expressoy.com.br",
                                      address: "Rua do Pedro, 3000",
                                      city: "Novo Hamburgo",
                                      state: "RS")

    visit shipping_company_prices_path(company)
    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
