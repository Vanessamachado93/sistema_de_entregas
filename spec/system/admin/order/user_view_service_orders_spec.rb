require "rails_helper"

describe "User see the Order" do
  it "sucessfully" do
    company = ShippingCompany.create!(corporate_name: "Transportadora São Miguel LTDA",
                                      brand_name: "São Miguel LTDA", registration_number: "34567987654567",
                                      email_domain: "saomiguel.com.br", address: "Av do João, 1000", city: "Porto Alegre",
                                      state: "RS")

    ford = Vehicle.create!(brand: "Ford", license_plate: "IXR7716", code_model: "Cargo 1117",
                           manufact_year: "2021", capacity: 50000, shipping_company: company)

    product = Product.create!(customer_name: "Pedro Silva", customer_address: "Av. Santos, 890 POA - RS",
                              distance: 100, weight: 1000, height: 10, width: 20, depth: 5, sku: "DFG456")

    order = Order.create!(shipping_company: company, product: product)

    user = User.create!(name: "Pedro", email: "saomiguel@saomiguel.com.br", password: "123456", shipping_company: company)

    login_as user, scope: :user
    visit shipping_companies_path
    click_on "ORDEM"

    expect(page).to have_content "ORDEM"
    expect(page).to have_content order.code
    expect(page).to have_content "Transportadora: Transportadora São Miguel LTDA"
  end
end
