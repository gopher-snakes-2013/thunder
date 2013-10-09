module SessionHelper
  def logged_in?
    !current_user.nil?
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
