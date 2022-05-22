def create_new_admin
    @new_admin = Admin.create!(nome: "Admin" email: "admin@sistemadefrete.com.br", password: "123456", password_confirmation: "123456")
end

