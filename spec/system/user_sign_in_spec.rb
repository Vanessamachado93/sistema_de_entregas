require "rails_helper"

describe "Usúario se autentica" do
  it "com sucesso" do
    User.create!(email: "email@example.com", password: "password")

    visit root_path
    click_on "Entrar"
    within("form") do
      fill_in "E-mail", with: "email@example.com"
      fill_in "Senha", with: "password"
      click_on "Entrar"
    end

    expect(page).to have_content "Login efetuado com sucesso"
    within("nav") do
      expect(page).not_to have_link "Entrar"
      expect(page).to have_link "Sair"
      expect(page).to have_content "email@example.com"
    end
    # Espera ver uma mensagem de sucesso => Usúario autenticado com sucesso
  end
end
