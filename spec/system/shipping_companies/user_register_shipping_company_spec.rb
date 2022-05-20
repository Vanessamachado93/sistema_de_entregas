require "rails_helper"

describe "Admin registers carrier" do
  it "from the carrier's home screen" do
    admin = Admin.create!(email: "email@example.com", password: "password")

    login_as admin, scope: :admin
    visit root_path
    click_on "Transportadoras"
    click_on "Adicionar transportadora"

    expect(page).to have_content "Cadastrar transportadora"
    expect(page).to have_field "Nome fantasia"
    expect(page).to have_field "Razão social"
    expect(page).to have_field "CNPJ"
    expect(page).to have_field "Domínio de e-mail"
    expect(page).to have_field "Endereço"
    expect(page).to have_field "Cidade"
    expect(page).to have_field "Estado"
    expect(page).to have_content "Voltar"
    click_on "Salvar"
  end

  it "with incomplete or invalid data" do
    admin = Admin.create!(email: "email@example.com", password: "password")

    login_as admin, scope: :admin
    visit root_path
    click_on "Transportadoras"
    click_on "Adicionar transportadora"
    fill_in "Razão social", with: ""
    fill_in "Nome fantasia", with: ""
    fill_in "CNPJ", with: "233445566"
    fill_in "Domínio de e-mail", with: ""
    fill_in "Endereço", with: "Av do Transporte, 20"
    fill_in "Cidade", with: " "
    fill_in "Estado", with: "RS"
    click_on "Salvar"

    expect(page).to have_content "Transportadora não cadastrada"
    expect(page).to have_content "Nome fantasia não pode ficar em branco"
    expect(page).to have_content " CNPJ não é válido"
    expect(page).to have_content " Cidade não pode ficar em branco"
  end

  it "de estar logado para criar uma transportadora" do
    visit "/shipping_companies/new"

    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end

  # it "deve estar logado para ver os detalahes de uma transpotadora" do
  #   company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
  #                                     brand_name: "R rapidão", registration_number: "34567987654567",
  #                                     email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
  #                                     city: "Porto Alegre", state: "RS")

  #   visit "shipping_companies/#{company.id}"

  #   expect(page).to have_content "Para continuar, faça login ou registre-se."
  # end
end
