class UsersController < ApplicationController
  skip_before_action :require_login, only: [:index, :new, :create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: "User successfully created!"
    else 
      render :new, notice: "User not created. Try again."
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user, notice: "User successfully updated!"
    else 
      render :edit, notice: "User not updated. Try again."
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to root_path, notice: "Account deleted!"
    else
      redirect_to @user, notice: "User coudn't be deleted."
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :photo, :cover_image)
  end
end
