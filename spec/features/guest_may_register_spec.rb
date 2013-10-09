require 'spec_helper'

feature "Guest may register as Norse Deity" do

  def register_as(user)
    visit "/"
    click_on "Register as a Norse Deity"

    fill_in "user_name", with: user[:name]
    fill_in "user_email", with: user[:email]
    fill_in "user_password", with: user[:password]

    click_on "Finish Registering"
  end

  context "When valid credentials are provided" do
    let(:users_attributes) do
      {
        name: "Zee",
        email: "zee@example.com",
        password: "password"
      }
    end
    scenario "Guest is thanked" do
      register_as(users_attributes)
      expect(page).to have_content("Thanks for registering, #{users_attributes[:name]}!")
    end

    scenario "Guest is logged in immediately" do
      register_as(users_attributes)

      visit "/"

      expect(page).to have_content("Logged in as: #{users_attributes[:name]}")
      expect(page).to have_content("Log out")

      expect(page).not_to have_content("Log in")
      expect(page).not_to have_content("Register")
    end
  end

  context "when valid credentials are not provided" do
    let(:users_attributes) do
      {
        name: "",
        email: "",
        password: ""
      }
    end
    scenario "Guest is asked to fix their errors" do
      register_as(users_attributes)

      expect(page).to have_content("Email can't be blank")
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Password can't be blank")
    end
  end
end
