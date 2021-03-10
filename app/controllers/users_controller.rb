class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[index new create]

  def index
    @users = User.order(created_at: :desc).limit(10).filter { |u| u != current_user }
  end

  def show
    @user = User.find(params[:id])
    @opinions = @user.opinions.order(created_at: :desc).limit(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'Account successfully created!'
    else
      render :new, notice: 'Account not created. Try again.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end
end
