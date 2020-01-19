class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
  end
  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render "new"
    end

  end

  def user_params
    params.require(:user).permit(:name, :user_name, :password, :password_confirmation,:email)
  end
end
