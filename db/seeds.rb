company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                  brand_name: "R rapidão",
                                  registration_number: "34567987654567",
                                  email_domain: "rapidao.com.br",
                                  address: "Av João Pedro, 400",
                                  city: "Porto Alegre", state: "RS")

User.create!(email: "rapidao@rapidao.com.br", password: "123456", shipping_company: company)

Vehicle.create!(brand: "Ford", license_plate: "IXX7788", code_model: "Cargo", manufact_year: "2020", capacity: 50000, shipping_company: company)

Admin.create!(email: "admin@sistemadefrete.com.br", password: "123456")

expressoa = ShippingCompany.create!(corporate_name: "Expresso B LTDA",
                                    brand_name: "Expresso B ", registration_number: "23344567893455",
                                    email_domain: "expressoa.com.br", address: "Av João Paulo, 100",
                                    city: "Porto Alegre", state: "RS")

User.create!(email: "expressoB@expressoa.com.br", password: "234567", shipping_company: expressoa)
