require 'spec_helper'

feature "Guest visits home page" do
# The feature keyword is provided by capybara rspec to
# make it easier to write acceptance tests.

# See https://github.com/jnicklas/capybara#using-capybara-with-rspec
# For more details

  scenario "They see a compelling name and description of Thunder" do
    visit "/"
    # visit is a method provided by capybara to navigate your
    # application from the users perspective.

    # See https://github.com/jnicklas/capybara#navigating
    # For more ways to interact with your app.

    expect(page).to have_content "Thunder!"
    # `expect` is part of rspec's assertion syntax.
    # It makes the test fail if the matcher
    # (in this case, `have_content`) returns false

    # See http://betterspecs.org/#expect
    # For why to use expect instead of should

    # See http://myronmars.to/n/dev-blog/2012/06/rspecs-new-expectation-syntax
    # For a detailed explanation of the syntax



    expect(page).to have_content "All the Awesome Lightning Talks"
    # `have_content` is a provided by Capybara
    # it searches the page for the passed in argument and
    # passes if it has that content

    # See https://github.com/jnicklas/capybara#querying
    # For more matchers you can use to assert.
  end
end