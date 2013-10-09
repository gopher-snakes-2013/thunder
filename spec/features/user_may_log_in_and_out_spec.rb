require 'spec_helper'

feature "User may log in and out" do
  let(:user_attributes) { random_user_attributes }
  let!(:user) { User.create(user_attributes) }
  def login(user)
    visit '/'
    click_on "Log in"

    fill_in :user_email, with: user[:email]
    fill_in :user_password, with: user[:password]

    click_on "Log in"
  end

  context "with valid login credentials" do
    scenario "User may log in" do
      login(user_attributes)
      expect(page).to have_content("Logged in as: #{user_attributes[:name]}")
    end
  end

  context "with invalid login credentials" do
    scenario "User is asked to log in again" do
      user_attributes[:password] = "wrong password"
      login(user_attributes)

      expect(page).to have_content("No user is registered with that email and password combination")

      expect(page.find_field("user_email").value).to eql user_attributes[:email]
    end
  end
  scenario "User may log out" do
    login(user_attributes)
    click_on "Log out"

    expect(page).to have_content("You have successfully logged out")
    expect(page).not_to have_content("Log out")
    expect(page).to have_content("Register")
    expect(page).to have_content("Log in")
  end
end
