require "rails_helper"

RSpec.describe Price, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields is blank" do
        company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA",
                                          brand_name: "R Rapião",
                                          registration_number: "34567987654567",
                                          email_domain: "saomiguel.com.br",
                                          address: "Av do João, 1000", city: "Porto Alegre",
                                          state: "RS")

        price = Price.new(minimum_weight: " ",
                          maximum_weight: " ",
                          minimum_cubic_meter: "",
                          maximum_cubic_meter: " ",
                          price_km: " ", shipping_company: company)

        expect(price).not_to be_valid

        expect(price.errors.full_messages).to include("Metro cúbico minímo não pode ficar em branco")
        expect(price.errors.full_messages).to include("Metro cúbico maxímo não pode ficar em branco")
        expect(price.errors.full_messages).to include("Metro cúbico minímo não pode ficar em branco")
        expect(price.errors.full_messages).to include("Peso máximo não pode ficar em branco")
        expect(price.errors.full_messages).to include("Preço por KM não pode ficar em branco")
      end
      it "False when shipping_company_id (transportadora) is empty" do
        company = ShippingCompany.create!(corporate_name: "Transportadora R rapidão LTDA",
                                          brand_name: "R Rapião",
                                          registration_number: "34567987654567",
                                          email_domain: "saomiguel.com.br",
                                          address: "Av do João, 1000", city: "Porto Alegre",
                                          state: "RS")

        price = Price.new(minimum_weight: " ",
                          maximum_weight: " ",
                          minimum_cubic_meter: "",
                          maximum_cubic_meter: " ",
                          price_km: " ",
                          shipping_company_id: " ")

        expect(price).not_to be_valid
      end
    end
  end
end
