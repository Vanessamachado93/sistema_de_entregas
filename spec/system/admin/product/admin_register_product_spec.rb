require "rails_helper"

describe "Admin visits register products page" do
  it "and see all required fields" do
    admin = Admin.create!(email: "admin@sistemadefrete.com.br", password: "123456")

    login_as(admin, :scope => :admin)
    visit(root_path)
    click_on("Produtos")
    click_on("Cadastrar Produto")

    expect(page).to have_field("Código do Produto")
    expect(page).to have_field("Nome do Cliente")
    expect(page).to have_field("Endereço de Entrega")
    expect(page).to have_field("Distância")
    expect(page).to have_field("Peso")
    expect(page).to have_field("Altura")
    expect(page).to have_field("Largura")
    expect(page).to have_field("Profundidade")
  end
  it "and are not successful in registering a product" do
    admin = Admin.create!(email: "admin@sistemadefrete.com.br", password: "123456")

    login_as(admin, :scope => :admin)
    visit(root_path)
    click_on("Produtos")
    click_on("Cadastrar Produto")
    fill_in("Código do Produto", with: "")
    fill_in("Nome do Cliente", with: "")
    fill_in("Endereço de Entrega", with: "")
    fill_in("Distância", with: " ")
    fill_in("Peso", with: " ")
    fill_in("Altura", with: " ")
    fill_in("Largura", with: " ")
    fill_in("Profundidade", with: " ")
    click_on("Salvar")

    expect(page).to have_content("Endereço de Entrega não pode ficar em branco")
    expect(page).to have_content("Distância não pode ficar em branco")
    expect(page).to have_content("Peso não pode ficar em branco")
    expect(page).to have_content("Altura não pode ficar em branco")
    expect(page).to have_content("Largura não pode ficar em branco")
    expect(page).to have_content("Não foi possível cadastrar o produto.")
  end
  it "and sucessfully register a product" do
    admin = Admin.create!(email: "admin@sistemadefrete.com.br", password: "123456")

    login_as(admin, :scope => :admin)
    visit(root_path)
    click_on("Produtos")
    click_on("Cadastrar Produto")
    fill_in("Código do Produto", with: "XXX2222")
    fill_in("Nome do Cliente", with: "Carlos")
    fill_in("Endereço de Entrega", with: "Rua Mariana, 101 - POA - RS")
    fill_in("Distância", with: "270")
    fill_in("Peso", with: "3000")
    fill_in("Altura", with: "34")
    fill_in("Largura", with: "23")
    fill_in("Profundidade", with: "29")
    click_on("Salvar")

    expect(page).to have_content("Produto cadastrado com sucesso!")
  end
end
