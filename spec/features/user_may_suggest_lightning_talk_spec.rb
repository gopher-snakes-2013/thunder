require 'spec_helper'

feature "User may suggest a lightning talk", js: true do
  let(:user_attributes) { random_user_attributes }
  let!(:user) { User.create(user_attributes) }

  context "with unique talk name" do
    scenario "user may suggest talk" do

      login(user_attributes)
      visit '/'
      fill_in "talk-name", with: "My cool talk"
      click_on "Suggest Talk"
      expect(page).to have_content("My cool talk")
    end
  end

  scenario "Guest may not suggest a talk" do
    visit '/'
    expect(page).not_to have_selector("#suggested-talks")
  end
end
