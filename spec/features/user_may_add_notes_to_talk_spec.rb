require 'spec_helper'

feature "Adding Notes" do
  scenario "Registered user may add notes to talk" do
    user = create_random_user
    talk = create_random_claimed_talk
    login(user)
    visit '/'
    within "#talk-#{talk.id}" do
      click_on "Add Notes"
      fill_in "Notes", with: "This was pretty amazing"
      click_on "Add Note"
      within ".notes" do
        expect(page).to have_content("This was pretty amazing")
      end
    end
  end
end
