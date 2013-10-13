require 'helpers/session_helper'
require 'collectors/collects_talks_for_rendering'
# This makes the module located at helpers/sessions_helper availiable
# We will tell sinatra it is a helper below

helpers do
  # helpers is a sinatra method
  # Views automatically have access to all helper methods.
  # Routes, views, and helpers all have access to the same methods
  # and instance variables.

  include SessionHelper
  # we can only include this here because it is required around line 28
  # with: require 'helpers/session_helper'

  include CollectsTalksForRendering

  def navigation_partial
    logged_in? ? :_user_navigation : :_guest_navigation
    # this operation uses a ternary operator which acts like:
    # puts condition ? value_if_true : value_else
  end

end

