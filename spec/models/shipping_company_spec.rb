require "rails_helper"

RSpec.describe ShippingCompany, type: :model do
  describe "#valid?" do
    context "presence" do
      it "mandatory fields are blank" do
        company = ShippingCompany.new(brand_name: "",
                                      corporate_name: " ",
                                      email_domain: " ",
                                      registration_number: "",
                                      address: " ", city: " ",
                                      state: " ")
        company.valid?

        expect(company.valid?).to eq false

        expect(company.errors.full_messages).to include("Nome fantasia não pode ficar em branco")
        expect(company.errors.full_messages).to include("Razão social não pode ficar em branco")
        expect(company.errors.full_messages).to include("CNPJ não pode ficar em branco")
        expect(company.errors.full_messages).to include("Domínio de e-mail não pode ficar em branco")
        expect(company.errors.full_messages).to include("Endereço não pode ficar em branco")
      end

      it "the CNPJ field must be unique" do
        firt_company = ShippingCompany.create!(brand_name: "Spolier",
                                               corporate_name: "Transporte Spolier Ltda",
                                               email_domain: "spolier.com.br",
                                               registration_number: "34345567000123",
                                               address: "Av. João Carlos, 1175",
                                               city: "São Leopoldo", state: "RS")

        second_company = ShippingCompany.new(registration_number: "34345567000123")
      end

      it "invalid cnpj size returns false" do
        company = ShippingCompany.new(registration_number: "3434556700012399")

        expect(company.valid?).to eq false
      end

      it "CNPJ with letters and numbers returns false" do
        company = ShippingCompany.new(registration_number: "3234LKMDKM9898")

        expect(company.valid?).to eq false
      end
    end
  end
end
