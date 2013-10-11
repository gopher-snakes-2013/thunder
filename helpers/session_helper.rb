module SessionHelper
# We tell sinatra this module is a helper in thunder_app.rb
# Views automatically have access to all helper methods.
# Routes, views, and helpers all have access to the same methods
# and instance variables.

  def logged_in?
    !current_user.nil?
    # current_user.nil? returns false if we have a user
    # since we want this method to return true if we have a user
    # the bang ! returns true for false and false for true
    # giving our method the expected functionality

  end

  def login(user)
    @current_user = user
    session[:user_id] = user.id
  end

  def current_user
    return nil unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end


  def log_out
    @current_user = nil
    session[:user_id] = nil
  end
end
