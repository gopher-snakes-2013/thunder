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

  def login_from_omniauth(auth_hash)
    user = User.find_or_create_by(provider: auth_hash['provider'], access_token: auth_hash['credentials']['token'])
    if user.password.nil?
    # Password is a required field, so let's assign a random password to a user who registers with oauth
      user.password = SecureRandom.hex
    end

    unless user.email.present? && user.name.present?
    # We don't want to overwrite their email or name if we've pulled a user from the database.
      user.update_attributes(email: auth_hash['info']['email'], name: auth_hash['info']['name'])
    end
    user.save
    # Let's ensure we've saved the user

    login(user)
    # And log that sucker in!

    redirect '/'
  end
end
