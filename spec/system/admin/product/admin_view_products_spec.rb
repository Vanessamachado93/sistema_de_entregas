require "rails_helper"

describe "Admin visits product page" do
  it "and see theres no registered products" do
    admin = Admin.create(email: "admin@sistemadefrete.com.br", password: "123456")

    login_as(admin, :scope => :admin)
    visit(root_path)
    click_on("Produtos")

    expect(page).to have_content("Não possuí produto na espera")
  end

  it "and see all products with status Esperando Ordem de Serviço" do
    admin = Admin.create(email: "admin@sistemadefrete.com.br", password: "123456")
    product_1 = Product.create!(customer_name: "Pedro", customer_address: "Av. Santos, 890 POA - RS",
                                distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "123")
    product_2 = Product.create!(customer_name: "Luiz", customer_address: "Av. Andradas, 234 POA - RS",
                                distance: 300, weight: 4000, height: 15, width: 10, depth: 10, sku: "125")

    login_as admin, :scope => :admin
    visit root_path
    click_on "Produtos"

    expect(page).to have_content("Código do Produto: 123")
    expect(page).to have_content("Nome do Cliente: Pedro")
    expect(page).to have_content("Endereço de entrega: Av. Santos, 890 POA - RS")
    expect(page).to have_content("Código do Produto: 125")
    expect(page).to have_content("Nome do Cliente: Luiz")
    expect(page).to have_content("Endereço de entrega: Av. Andradas, 234 POA - RS")
  end
end
