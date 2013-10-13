require 'spec_helper'


feature "Claiming a lightning talk" do
  let(:user_attributes) { random_user_attributes }
  let!(:user) { User.create(user_attributes) }
  let!(:talk) { Talk.create(random_talk_attributes) }

  scenario "Registered user may claim a lightning talk" do
    login(user_attributes)
    visit '/'
    within "#talk-#{talk.id}" do
      click_on "I'll do it!"
    end

    expect(page).to have_content("#{talk.name} - Presented By #{user.name}")
  end
end
