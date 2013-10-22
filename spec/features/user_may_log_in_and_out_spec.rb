require 'spec_helper'

feature "User may log in and out" do
  let(:user_attributes) { random_user_attributes }
  let!(:user) { User.create(user_attributes) }

  context "with valid login credentials" do
    scenario "User may log in" do
      login(user_attributes)
      expect(page).to have_content("Logged in as: #{user_attributes[:name]}")
    end

    scenario "with github" do
      user = stub_out_registered_github_user

      visit "/"
      click_on "log-in-link"
      expect {
        click_on "Log in with Github"
      }.not_to change { User.count }

      expect(page).to have_content "Logged in as: #{user.name}"
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
