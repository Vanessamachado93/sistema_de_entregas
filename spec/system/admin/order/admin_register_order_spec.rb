# require "rails_helper"

# describe "Usúario cadastrada ordem de serviço" do
#   it "com sucesso" do
#     company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA",
#                                       brand_name: "R Rapião",
#                                       registration_number: "34567987654567",
#                                       email_domain: "saomiguel.com.br",
#                                       address: "Av do João, 1000", city: "Porto Alegre",
#                                       state: "RS")

#     ShippingCompany.create!(corporate_name: "Transportadora Marvel LTDA",
#                             brand_name: " Marvel",
#                             registration_number: "90456789000134",
#                             email_domain: "marvel@marvel.com.br",
#                             address: "Av do João, 2000", city: "Porto Alegre",
#                             state: "RS")

#     ford = Vehicle.create!(brand: "Ford", license_plate: "IXR7716", code_model: "Cargo 1117",
#                            manufact_year: "2021",
#                            capacity: 50000, shipping_company: company)

#     Vehicle.create!(brand: "Ford", license_plate: "III5566", code_model: "Cargo 0001",
#                     manufact_year: "2018",
#                     capacity: 50000, shipping_company: company)

#     Admin.create!(nome: "Pedro", email: "admin@sistemadefrete.com.br", password: "123456")
#     login_as admin, scope: :admin
#     click_on "Registrar Ordem de Serviço"
#     select
#     select
#     click_on "Gravar"

#     expect(page).to have_content ""
#     expect(page).to have_content ""
#     expect(page).to have_content ""
#     expect(page).to have_content ""
#   end
# end
