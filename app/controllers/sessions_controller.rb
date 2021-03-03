class SessionsController < ApplicationController
  skip_before_action :require_login

  def welcome
    redirect_to opinions_path if logged_in?
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:current_user_id] = user.id
      redirect_to opinions_path, notice: "Logged in. Welcome!"
    else
      redirect_to new_user_url, notice: "Username not found! Want to create an account, instead?"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out."
  end
end
