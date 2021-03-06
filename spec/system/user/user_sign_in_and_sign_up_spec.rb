require "rails_helper"

describe "User authenticates" do
  it "successfully" do
    #Arrange
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    User.create!(email: "email@example.com", password: "password", shipping_company: company)

    visit root_path
    click_on "Acessar como Usúario"
    fill_in "E-mail", with: "email@example.com"
    fill_in "Senha", with: "password"
    click_on "Entrar"

    expect(page).to have_content "Login efetuado com sucesso"
    within("nav") do
      expect(page).not_to have_link "Acessar como Usúario"
      expect(page).not_to have_link "Transportadoras"
      expect(page).not_to have_link "Area Administrativa"
      expect(page).to have_link "Minha transportadora"
      expect(page).to have_button "Sair"
      expect(page).to have_content "email@example.com"
    end
  end

  it "and logout" do
    company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                      brand_name: "R rapidão", registration_number: "34567987654567",
                                      email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                      city: "Porto Alegre", state: "RS")

    User.create!(email: "email@example.com", password: "password", shipping_company: company)

    visit root_path
    click_on "Acessar como Usúario"
    fill_in "E-mail", with: "email@example.com"
    fill_in "Senha", with: "password"
    click_on "Entrar"

    click_on "Sair"

    expect(page).to have_content "Logout efetuado com sucesso"
    expect(page).to have_link "Acessar como Usúario"
    expect(page).not_to have_button "Sair"
    expect(page).not_to have_content "emial@example.com"
  end
end
