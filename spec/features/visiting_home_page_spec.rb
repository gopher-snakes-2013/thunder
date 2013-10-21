require 'spec_helper'

feature "Visiting home page" do
  context "when not logged in" do
    scenario "They see a compelling name and description of Thunder" do
      visit "/"

      expect(page).to have_content "Thunder!"
    end
  end

  context "When logged in" do
    scenario "They see a list of upcoming, suggested, and completed talks" do
      user = create_random_user
      suggested_talk = create_random_unclaimed_talk
      claimed_talk = create_random_claimed_talk
      completed_talk = create_random_completed_talk

      login(user)
      visit '/'

      within '#suggested-talks' do
        expect(page).to have_content suggested_talk.name
      end

      within '#upcoming-talks' do
        expect(page).to have_content claimed_talk.name
      end

      within '#completed-talks' do
        expect(page).to have_content completed_talk.name
      end
    end
  end
end
