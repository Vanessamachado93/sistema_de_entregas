require "rails_helper"

describe "Admin authenticates" do
  it "successfully" do
    #Arrange
    #Act
    Admin.create!(email: "email@example.com", password: "password")
    visit root_path
    click_on "Area Administrativa"
    within("form") do
      fill_in "E-mail", with: "email@example.com"
      fill_in "Senha", with: "password"
      click_on "Entrar"
    end
    #Assert
    expect(page).to have_content "Login efetuado com sucesso"
    within("nav") do
      expect(page).not_to have_link "Entrar"
      expect(page).to have_link "Transportadoras"
      expect(page).not_to have_link "Minha transportadora"
      expect(page).not_to have_link "Area Administrativa"
      expect(page).to have_button "Sair"
      expect(page).to have_content "email@example.com"
    end
  end

  # Espera ver uma mensagem de sucesso => Usúario autenticado com sucesso
  it "and logout" do
    Admin.create!(email: "email@example.com", password: "password")

    visit root_path
    click_on "Area Administrativa"
    fill_in "E-mail", with: "email@example.com"
    fill_in "Senha", with: "password"
    within("form") do
      click_on "Entrar"
    end

    click_on "Sair"

    expect(page).to have_content "Logout efetuado com sucesso"
    expect(page).to have_link "Entrar"
    expect(page).not_to have_button "Sair"
    expect(page).not_to have_content "emial@example.com"
  end
end
