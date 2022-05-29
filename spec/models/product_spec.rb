require "rails_helper"

RSpec.describe Product, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields is blank" do
        product = Product.new(customer_name: " ", customer_address: " ",
                              distance: " ", weight: " ", height: " ", width: " ", depth: "", sku: "")

        expect(product).not_to be_valid

        expect(product.errors.full_messages).to include("Nome do Cliente não pode ficar em branco")
        expect(product.errors.full_messages).to include("Endereço de Entrega não pode ficar em branco")
        expect(product.errors.full_messages).to include("Altura não pode ficar em branco")
        expect(product.errors.full_messages).to include("Distância não pode ficar em branco")
        expect(product.errors.full_messages).to include("Peso não pode ficar em branco")
        expect(product.errors.full_messages).to include("Largura não pode ficar em branco")
        expect(product.errors.full_messages).to include("Profundidade não pode ficar em branco")
      end
    end
  end
end
