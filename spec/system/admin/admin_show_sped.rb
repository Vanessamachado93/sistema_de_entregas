it "must be logged in to view carrier details" do
  company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                    brand_name: "R rapidão", registration_number: "34567987654567",
                                    email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                    city: "Porto Alegre", state: "RS")

  visit "shipping_companies/#{company.id}"

  expect(page).to have_content "Para continuar, faça login ou registre-se."
end
