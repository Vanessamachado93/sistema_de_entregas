require "rails_helper"

describe "Admin accesses main page of shipping companies" do
  it "and see registered shipping companies" do
    company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA", brand_name: "R Rapião",
                                      registration_number: "34567987654567", email_domain: "saomiguel.com.br",
                                      address: "Av do João, 1000", city: "Porto Alegre",
                                      state: "RS")

    admin = Admin.create!(email: "email@example.com", password: "123456")

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
end
