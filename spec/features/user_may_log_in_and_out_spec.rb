require 'spec_helper'

feature "User may log in and out" do
  scenario "User may log in" do
    user_attributes = random_user_attributes
    user = User.create(user_attributes)

    visit '/'
    click_on "Log in"

    fill_in :user_email, with: user_attributes[:email]
    fill_in :user_password, with: user_attributes[:password]

    click_on "Log in"

    expect(page).to have_content("Logged in as: #{user_attributes[:name]}")
  end
end
