require "rails_helper"

describe "Visitor registers carrier" do
  it "from the carrier's home screen" do
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
    visit root_path
    click_on "Transportadora"
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
end
