require "rails_helper"

describe "Visiting the home page" do
  it "and see the application title" do
    #Arrange

    #Act
    visit root_path
    expect(page).to have_content "SISTEMA DE ENTREGAS"
  end

  it "and see the application title" do
    visit root_path

    within("nav") do
      expect(page).to have_link "Início"
    end
  end
end
