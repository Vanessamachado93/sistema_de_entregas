require "rails_helper"

describe "User register delivery time setting" do
  it "successfully" do
    company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                      brand_name: "Sul Expresso",
                                      registration_number: "85748905576545",
                                      email_domain: "sul@sulexpress.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")

    user = User.create!(email: "sul@sulexpress.com.br", password: "123456",
                        shipping_company: company)

    TimeDelivery.create!(min_distance: 0,
                         max_distance: 100,
                         time: 2, shipping_company: company)

    TimeDelivery.create!(min_distance: 101,
                         max_distance: 300,
                         time: 5, shipping_company: company)

    login_as user, scope: :user
    visit root_path
    click_on "Minha transportadora"
    click_on "Cadastrar prazo de entrega"

    expect(page).to have_content "Para entrega de 0 a 100 km, o prazo é 2 dias."
    expect(page).to have_content "Para entrega de 101 a 300 km, o prazo é 5 dias."
  end

  it "and there are no registered time delivery" do
    company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                      brand_name: "Sul Expresso",
                                      registration_number: "85748905576545",
                                      email_domain: "sul@sulexpress.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "sul@sulexpress.com.br", password: "123456",
                        shipping_company: company)

    login_as user, scope: :user
    visit shipping_company_time_deliveries_path(company)

    expect(page).to have_content "Não existe lista de prazos de entrega cadastrados."
    expect(page).to have_link "Voltar", href: shipping_company_path(company)
  end
end
