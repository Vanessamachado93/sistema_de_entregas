require "rails_helper"

describe "Admin sees their own orders" do
  it "and must be authenticated" do
    admin = Admin.create!(email: "admin@sistemadeentregas.com.br", password: "123456")
    login_as(admin)
    visit root_path
    click_on "Minhas Ordens"

    expect(page).to have_content "Minhas Ordens"
  end
end
