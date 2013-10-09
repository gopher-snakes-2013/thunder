require 'spec_helper'

feature "Guest may register as Norse Deity" do
  let(:users_attributes) do
    {
      name: "Zee",
      email: "zee@example.com",
      password: "password"
    }
  end

  def register_as(user)
    visit "/"
    click_on "Register as a Norse Deity"

    fill_in "user_name", with: user[:name]
    fill_in "user_email", with: user[:email]
    fill_in "user_password", with: user[:password]

    click_on "Finish Registering"
  end
  scenario "Guest is thanked after registering" do
    register_as(users_attributes)
    expect(page).to have_content("Thanks for registering, #{users_attributes[:name]}!")
  end

  scenario "Guest is logged in immediately after registering" do
    register_as(users_attributes)

    visit "/"

    expect(page).to have_content("Logged in as: #{users_attributes[:name]}")
    expect(page).to have_content("Log out")

    expect(page).not_to have_content("Log in")
    expect(page).not_to have_content("Register")
  end

  scenario "Guest must provide an email address"
  scenario "Guest must provide a password"
end
