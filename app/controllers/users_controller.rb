class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    # 購入履歴リスト 新しいものから５件表示
    @history = ShoppingCart.joins(:cart_items => :item)
                          .select("cart_items.id", "items.item_name","items.artist_id")
                          .where(:user_id => @user.id)
                          .order("cart_items.id DESC")
                          .limit(5)
                          # 実行結果：
                          # SELECT cart_items.id, items.item_name, items.artist_id
                          # FROM "shopping_carts"
                          # INNER JOIN "cart_items" ON "cart_items"."shopping_cart_id" = "shopping_carts"."id"
                          # INNER JOIN "items" ON "items"."id" = "cart_items"."item_id"
                          # WHERE "shopping_carts"."user_id" = $1
                          # ORDER BY cart_items.id DESC
                          # LIMIT $2  [["user_id", 1], ["LIMIT", 5]]
    # マイコミュニティリスト 新らしいものから５件表示
    @my_communities = UsersCommunity.joins(:community)
                                      .select("communities.artist_id")
                                      .where(:user_id => @user.id)
                                      .order("users_communities.id DESC")
                                      .limit(5)
                                      # SELECT communities.artist_id
                                      # FROM "users_communities"
                                      # INNER JOIN "communities" ON "communities"."id" = "users_communities"."community_id"
                                      # WHERE "users_communities"."user_id" = 1
                                      # ORDER BY users_communities.id DESC
    @artist = Artist
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
    @user = User.find(params[:id])
    @community = UsersCommunity.where(user_id: @user.id).page(params[:page]).per(10)
  end

  private
  def user_params
    params.require(:user).permit(:postal_code, :address, :phone_number, :email, :password, :image, :introduction)
  end
end
