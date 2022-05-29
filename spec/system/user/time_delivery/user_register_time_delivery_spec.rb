require "rails_helper"

describe "User register delivery time setting" do
  it "successfully" do
    company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                      brand_name: "Sul Expresso",
                                      registration_number: "85748905576545",
                                      email_domain: "sul@sulexpress.com.br",
                                      address: "Rua Mariana, 190",
                                      city: "Porto Alegre",
                                      state: "RS")

    user = User.create!(email: "sul@sulexpress.com.br", password: "123456",
                        shipping_company: company)
    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"
    click_on "Cadastrar prazo de entrega"
    click_on "Adicionar Prazo"
    fill_in "Distancia mínima:", with: "400"
    fill_in "Distancia maxíma", with: "700"
    fill_in "Prazo de entrega", with: "7"
    click_on "Cadastrar"

    expect(current_path).to eq new_shipping_company_time_delivery_path(company)
    expect(page).to have_content "Prazo cadastrado com sucesso."
  end

  it "with incomplete data" do
    company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                      brand_name: "Sul Expresso",
                                      registration_number: "85748905576545",
                                      email_domain: "sul@sulexpress.com.br",
                                      address: "Rua Mariana, 190",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "sul@sulexpress.com.br", password: "123456",
                        shipping_company: company)

    login_as user, scope: :user
    visit new_shipping_company_time_delivery_path(company)
    fill_in "Distancia mínima:", with: " "
    fill_in "Distancia maxíma", with: " "
    fill_in "Prazo de entrega", with: " "
    click_on "Cadastrar"

    expect(page).to have_content "não pode ficar em branco", count: 3
    expect(page).to have_content "Prazo não cadastrado."
    expect(page).to have_link "Voltar", href: shipping_company_time_deliveries_path(company)
  end
  it "and you need to be logged in" do
    company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                      brand_name: "Sul Expresso",
                                      registration_number: "85748905576545",
                                      email_domain: "sul@sulexpress.com.br",
                                      address: "Rua Mariana, 190",
                                      city: "Porto Alegre",
                                      state: "RS")
    visit new_shipping_company_time_delivery_path(company)
    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
