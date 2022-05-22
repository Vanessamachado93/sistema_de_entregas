require "rails_helper"

describe "User authenticates" do
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

    # Assert
    expect(page).to have_content "expressox@express.com.br"
    expect(page).to have_content "Minha transportadora"
    expect(page).to have_button "Sair"
    expect(page).to_not have_link "Entrar"
  end
end
