class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logged_in?, :require_login, :current_user

  def current_user
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logged_in?
    current_user != nil
  end

  def require_login
    redirect_to new_session_url unless current_user
  end

  def login_user!(user)
    tok = SecureRandom.urlsafe_base64(128)
    user.session_token = tok
    user.save
    session[:token] = tok
  end

  def logout!
    current_user.session_token = User.generate_session_token
    session[:token] = nil
  end
end
