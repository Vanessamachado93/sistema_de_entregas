require "rails_helper"

RSpec.describe User, type: :model do
  describe "#valid?" do
    context "presence" do
      it "False when fields is empty" do
        user = User.new(email: "", password: "", password_confirmation: "")

        user.valid?

        expect(user.valid?).to eq false

        expect(user.errors.full_messages).to include("Senha não pode ficar em branco")
        expect(user.errors.full_messages).to include("E-mail não pode ficar em branco")
      end
    end
  end
end
