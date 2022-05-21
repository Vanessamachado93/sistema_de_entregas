require "rails_helper"

RSpec.describe Vehicle, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields are blank" do
        company = ShippingCompany.create!(corporate_name: "Transportes Rapidão LTDA",
                                          brand_name: "R rapidão", registration_number: "90456345000198",
                                          email_domain: "rapidao.com.br", address: "Av João Pedro, 400",
                                          city: "Porto Alegre", state: "RS")

        vehicle = Vehicle.new(license_plate: "",
                              brand: "",
                              code_model: "",
                              manufact_year: "",
                              capacity: "",
                              shipping_company: company)

        vehicle.valid?

        expect(vehicle.valid?).to eq false

        expect(vehicle.errors.full_messages).to include("Placa não possui o tamanho esperado (7 caracteres)")
        expect(vehicle.errors.full_messages).to include("Marca não pode ficar em branco")
        expect(vehicle.errors.full_messages).to include("Ano de fabricação não pode ficar em branco")
        expect(vehicle.errors.full_messages).to include("Capacidade não pode ficar em branco")
        expect(vehicle.errors.full_messages).to include("Modelo não pode ficar em branco")
      end
    end
  end
end
