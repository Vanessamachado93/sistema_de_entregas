require "rails_helper"

RSpec.describe Admin, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields is empty" do
        admin = Admin.new(email: "", password_confirmation: "")

        admin.valid?

        expect(admin.valid?).to eq false

        expect(admin.errors.full_messages).to include("Senha não pode ficar em branco")
        expect(admin.errors.full_messages).to include("E-mail não pode ficar em branco")
      end
    end
  end
end
