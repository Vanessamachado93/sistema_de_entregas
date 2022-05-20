# require "rails_helper"

# describe "User authenticates" do
#   it "successfully" do
#     #Arrange

#     #Act
#     visit root_path
#     click_on "Entrar"
#     click_on "Sign up"
#     fill_in "Nome", with: "Carlos"
#     fill_in "E-mail", with: "carlos@gmail.com"
#     fill_in "Senha", with: "password"
#     fill_in "Confirme sua senha", with: "password"
#     click_on "Criar conta"
#     # Assert
#     expect(page).to have_content "Boas vindas! Você realizou seu registro com sucesso."
#     expect(page).to have_content "carlos@gmail.com"
#     expect(page).to have_button "Sair"
#     user = User.last
#     expect(user.name).to eq "Carlos"
#   end
# end
