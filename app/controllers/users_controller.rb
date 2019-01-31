class UsersController < ApplicationController
  before_action :authenticate_admin

  def show
    @user = User.find(params[:id])
    # 購入履歴リスト
    cart = ShoppingCart.where(:user_id => @user.id).where(:is_active => false).pluck(:id)
    @history = CartItem.includes(:item => :artist).where(shopping_cart_id: cart).limit(5).order("id DESC")
    # マイコミュニティリスト
    @my_communities = UsersCommunity.includes(:community => :artist).where(:user_id => @user.id).first(5)
    users = User.order("point DESC")
    users.each.with_index(1) do |u, i|
      if u.id == @user.id
        @rank = i
        break
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def cancel_show
  end

  def cancel_update
    @user = User.find(current_user.id)
    @user.is_active = false
    @user.point = 0
    @user.update(users_params)
    redirect_to logout_path
  end

  def ranking_show
    @users = User.where(admin: false).order("point DESC")
  end

  def my_community_index
    @user = User.find(params[:id])
    @community = UsersCommunity.where(user_id: @user.id).page(params[:page]).per(10)
  end

  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :phone_number, :email, :password, :image, :introduction)
  end
  def users_params
    params.permit(:is_active, :point)
  end
end