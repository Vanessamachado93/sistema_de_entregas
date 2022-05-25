require "rails_helper"

describe "Admin accesses main page of shipping companies" do
  it "and see registered shipping companies" do
    ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA",
                            brand_name: "R Rapião",
                            registration_number: "34567987654567",
                            email_domain: "saomiguel.com.br",
                            address: "Av do João, 1000", city: "Porto Alegre",
                            state: "RS")

    ShippingCompany.create!(corporate_name: "Transportadora E rapidão LTDA",
                            brand_name: "Expresso E",
                            registration_number: "34567987677567",
                            email_domain: "expressoe.com.br",
                            address: "Av do João, 100", city: "Porto Alegre",
                            state: "RS")

    admin = Admin.create!(email: "expresso@expressoe.com.br", password: "123456")

    login_as admin, scope: :admin
    visit root_path
    click_on "Transportadoras"

    expect(current_path).to eq shipping_companies_path
    expect(page).to have_content "SISTEMA DE ENTREGAS"
    expect(page).to have_content "Adicionar transportadora"
    expect(page).to have_content "Transportadoras"
    expect(page).to have_content "R Rapião"
    expect(page).to have_content "CNPJ: 34567987654567"
    expect(page).to have_content "Localidade: Porto Alegre - RS"
  end
  xit "QUANDO NÃO TIVER NEHUMA TRANSPOTADORA"

  it "must be logged in to view shipping companies list" do
    visit shipping_companies_path

    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
