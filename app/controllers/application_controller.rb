class ApplicationController < ActionController::Base
  before_action :require_login

  helper_method :current_user
  helper_method :logged_in?

  def current_user
    User.find_by(id: session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    unless logged_in?
      redirect_to login_path, notice: "You must be logged in to access that page."
    end
  end
end
