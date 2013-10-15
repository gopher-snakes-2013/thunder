require 'spec_helper'

feature "Adding Notes" do
  let(:user) { create_random_user }
  let!(:talk) { create_random_claimed_talk }
  before {
    login(user)
  }

  scenario "Registered user may see notes for a talk" do
    talk = create_talk_with_notes

    visit '/'

    click_on talk.name

    within ".notes" do
      talk.notes.each do |note|
        expect(page).to have_content(note.body)
        expect(page).to have_content(note.author_name)
      end
    end
  end
  scenario "Registered user may add notes to talk" do
    visit '/'

    within "#talk-#{talk.id}" do
      click_on "Add Notes"
    end

    fill_in "note_body", with: "This was pretty amazing"

    click_on "Add Note"

    expect(talk.notes.first.body).to eql("This was pretty amazing")
  end
end
