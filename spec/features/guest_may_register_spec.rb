require 'spec_helper'

feature "Guest may register as Norse Deity" do
  scenario "Guest is thanked after registering" do
    visit "/"
    click_on "Register as a Norse Deity"

    fill_in "user_name", with: "Zee"
    fill_in "user_email", with: "zee@example.com"
    fill_in "user_password", with: "password"

    click_on "Finish Registering"

    expect(page).to have_content("Thanks for registering, Zee!")
  end

  scenario "Guest is logged in immediately after registering"
  scenario "Guest must provide an email address"
  scenario "Guest must provide a password"
end
