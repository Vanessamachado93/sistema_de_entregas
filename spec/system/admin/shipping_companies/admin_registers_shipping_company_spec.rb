require "rails_helper"

describe "Admin registers shipping companies" do
  it "from the shipping companies home screen" do
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
  end

  it "Successfuly" do
    admin = Admin.create!(email: "email@example.com", password: "password")

    login_as admin, scope: :admin
    visit root_path
    click_on "Transportadoras"
    click_on "Adicionar transportadora"
    fill_in "Razão social", with: "Expresso A"
    fill_in "Nome fantasia", with: "Expresso A LTDA"
    fill_in "CNPJ", with: "90234567823454"
    fill_in "Domínio de e-mail", with: "expresso@expressoa.com.br"
    fill_in "Endereço", with: "Av do Transporte, 30"
    fill_in "Cidade", with: "Canoas"
    fill_in "Estado", with: "RS"
    click_on "Salvar"

    expect(page).to have_content "Transportadora cadastrada com sucesso"
    expect(page).to have_content "Razão Social: Expresso A"
    expect(page).to have_content "CNPJ: 90234567823454"
    expect(page).to have_content "Endereço: Av do Transporte, 30"
    expect(page).to have_content "Localidade: Canoas - RS"
    expect(page).to have_content "Status: Inativa"
    expect(page).to have_link "Voltar", href: shipping_companies_path
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
    expect(page).to have_link "Voltar", href: shipping_companies_path
  end

  it "must be logged in to create a carrier" do
    visit new_shipping_company_path

    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
