# require "rails_helper"

# describe "Admin see shipping company details" do
#   it "from home screen" do
#     company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
#                                       brand_name: "R Rapidão", registration_number: "34567987654567",
#                                       email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
#                                       city: "Porto Alegre", state: "RS")

#     admin = Admin.create!(email: "email@example.com", password: "123456")

#     login_as admin, scope: :admin
#     visit root_path
#     click_on "Transportadoras"
#     expect(page).to have_content "R Rapidão"
#     expect(page).to have_content "CNPJ: 34567987654567"
#     expect(page).to have_content "Localidade: Porto Alegre - RS"

#     expect(page).to have_link("Adicionar transportadora", href: new_shipping_company_path)
#   end
# end
