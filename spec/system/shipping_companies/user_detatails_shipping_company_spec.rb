require "rails_helper"

describe "user see shipping company details" do
  it "from home screen" do
    R = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                brand_name: "R rapidão", registration_number: "34567987654567",
                                email_domain: "@rapidao.com.br", address: "Av João Pedro, 400",
                                city: "Porto Alegre", state: "RS")

    visit root_path
    click_on "Transportadoras"
    click_on "R rapidão"

    expect(page).to have_content "Transportadora R rapidão"
    expect(page).to have_content "Transportadora R rapidão"
    expect(page).to have_content "CNPJ: 34567987654567"
    expect(page).to have_content "Endereço: Av João Pedro, 400"
    expect(page).to have_content "Localidade: Porto Alegre - RS"
  end
  it "and back to the shipping company page" do
    R = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                brand_name: "R rapidão", registration_number: "34567987654567",
                                email_domain: "@rapidao.com.br", address: "Av João Pedro, 400",
                                city: "Porto Alegre", state: "RS")
    visit root_path
    within(".nav") do
      click_on "Transportadoras"
    end
    click_on "R rapidão"
    click_on "VOLTAR"

    expect(current_path).to eq shipping_companies_path
    expect(page).to have_content "Transportadoras"
  end
end
