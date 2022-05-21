require "rails_helper"

describe "User registers a new vehicle" do
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
    visit shipping_company_path(company)
    click_on "Cadastrar veículo"
    fill_in "Placa", with: "ION1617"
    fill_in "Marca", with: "Ford"
    fill_in "Modelo", with: "Cargo"
    fill_in "Ano de fabricação", with: "2016"
    fill_in "Capacidade", with: "500000"
    click_on "Cadastrar"

    expect(page).to have_content "Veículo cadastrado com sucesso"
    expect(page).to have_content "Ford Cargo"
    expect(page).to have_content "Ano de fabricação: 2016"
    expect(page).to have_content "Capacidade: 500000g"
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
    visit shipping_company_path(company)
    click_on "Cadastrar veículo"
    fill_in "Placa", with: ""
    fill_in "Marca", with: "Ford"
    fill_in "Modelo", with: ""
    fill_in "Ano de fabricação", with: ""
    fill_in "Capacidade", with: ""
    click_on "Cadastrar"

    expect(page).to have_content "Placa não pode ficar em branco"
    expect(page).to have_content "Ano de fabricação não pode ficar em branco"
    expect(page).to have_content "Capacidade não pode ficar em branco"
  end
end
