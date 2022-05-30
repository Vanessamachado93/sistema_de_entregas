require "rails_helper"

describe "Admin authenticates" do
  it "successfully" do
    Admin.create!(email: "email@example.com", password: "password")
    visit root_path
    click_on "Acessar como Administrador"
    fill_in "E-mail", with: "email@example.com"
    fill_in "Senha", with: "password"
    click_on "Entrar"

    expect(page).to have_content "Login efetuado com sucesso"
    within("nav") do
      expect(page).not_to have_link "Acessar como Usúario"
      expect(page).to have_link "Transportadoras"
      expect(page).not_to have_link "Minha transportadora"
      expect(page).not_to have_link "Acessar como Administrador"
      expect(page).to have_button "Sair"
      expect(page).to have_content "email@example.com"
    end
  end

  it "and logout" do
    Admin.create!(email: "email@example.com", password: "password")

    visit root_path
    click_on "Acessar como Administrador"
    fill_in "E-mail", with: "email@example.com"
    fill_in "Senha", with: "password"

    click_on "Entrar"
    click_on "Sair"

    expect(page).to have_content "Logout efetuado com sucesso"
    expect(page).to have_link "Acessar como Usúario"
    expect(page).not_to have_button "Sair"
    expect(page).not_to have_content "emial@example.com"
  end
end
