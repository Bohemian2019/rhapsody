class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update!(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def cancel_show
  end

  def ranking_show
    @users = User.where(admin: false).order("point DESC")
  end

  def my_community_index
  end

  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :phone_number, :email, :password, :image, :introduction)
  end
end
