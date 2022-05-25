require "rails_helper"

describe "User accesses shipping company page" do
  it "and see vehicles list" do
    company = ShippingCompany.create!(corporate_name: "Expresso P LTDA",
                                      brand_name: "Expresso H",
                                      registration_number: "85748909876540",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")

    other_company = ShippingCompany.create!(corporate_name: "Expresso J LTDA",
                                            brand_name: "Expresso J",
                                            registration_number: "85748909876549",
                                            email_domain: "expressj.com.br",
                                            address: "Rua Mariana, 109",
                                            city: "Porto Alegre",
                                            state: "RS")

    Vehicle.create!(brand: "Ford", license_plate: "IXR7755", code_model: "Cargo 1090", manufact_year: "2021",
                    capacity: 50000, shipping_company: other_company)

    Vehicle.create!(brand: "Ford", license_plate: "IXR7716", code_model: "Cargo 1117", manufact_year: "2021",
                    capacity: 50000, shipping_company: company)
    Vehicle.create!(brand: "Ford", license_plate: "IXX5803", code_model: "Cargo 1844", manufact_year: "2021",
                    capacity: 50000, shipping_company: company)

    user = User.create!(email: "expressop@express.com.br",
                        password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit shipping_company_path(company)

    click_on "Veículos"

    expect(page).to have_content "Cargo 1117"
    expect(page).to have_content "Cargo 1844"
    expect(page).not_to have_content "Cargo 1090"
    expect(page).to have_link "Voltar", href: shipping_company_path(company)
  end

  it "and there are no registered vehicles" do
    company = ShippingCompany.create!(corporate_name: "Expresso H LTDA",
                                      brand_name: "Expresso H ",
                                      registration_number: "85748909876540",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    user = User.create!(email: "expressop@express.com.br",
                        password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit shipping_company_vehicles_path(company)

    expect(page).to have_content "Não existem veículos registrados"
  end

  it "must be logged in to view vehicles list" do
    company = ShippingCompany.create!(corporate_name: "Expresso H LTDA",
                                      brand_name: "Expresso H ",
                                      registration_number: "85748909876540",
                                      email_domain: "express.com.br",
                                      address: "Rua Mariana, 100",
                                      city: "Porto Alegre",
                                      state: "RS")
    visit shipping_company_vehicles_path(company)

    expect(page).to have_content "Para continuar, faça login ou registre-se."
  end
end
