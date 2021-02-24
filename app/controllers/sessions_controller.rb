class SessionsController < ApplicationController
  skip_before_action :require_login

  def welcome
  end

  def new
  end

  def create
    user = User.find_by(username: params[:username])

    if user
      session[:current_user_id] = user.id
      redirect_to user
    else
      redirect_to new_user_url, notice: "Username not found! Want to create an account, instead?"
    end
  end

  def destroy
    reset_session
    redirect_to root_url, notice: "Logged out."
  end
end
