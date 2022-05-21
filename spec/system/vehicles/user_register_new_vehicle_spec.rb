require "rails_helper"

describe "Usuário cadastra um novo veículo" do
  it "com sucesso" do
    company = ShippingCompany.create!(corporate_name: "Expresso X LTDA",
                                      brand_name: "Expresso X ",
                                      registration_number: "34236789243524",
                                      email_domain: "expressox.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "expressox@expressox.com.br", password: "123456",
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
end
