require "rails_helper"

RSpec.describe TimeDelivery, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields is blank" do
        company = ShippingCompany.create!(corporate_name: "Sul Expresso LTDA",
                                          brand_name: "Sul Expresso",
                                          registration_number: "85748905576545",
                                          email_domain: "sul@sulexpress.com.br",
                                          address: "Rua Mariana, 190",
                                          city: "Porto Alegre",
                                          state: "RS")
        time = TimeDelivery.new(min_distance: " ",
                                max_distance: " ",
                                time: " ", shipping_company: company)

        expect(time).not_to be_valid

        expect(time.errors.full_messages).to include("Distancia mínima não pode ficar em branco")
        expect(time.errors.full_messages).to include("Distancia maxíma não pode ficar em branco")
        expect(time.errors.full_messages).to include("Prazo não pode ficar em branco")
      end
    end
  end
end
