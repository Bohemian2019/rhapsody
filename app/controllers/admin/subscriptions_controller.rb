class Admin::SubscriptionsController < ApplicationController
  def index
  	@subscriptions = Subscription.all.page(params[:page]).per(10).order(:id)
  end

  def artist
  	@artist = Artist.find(params[:id])
  	@subscription = Subscription.where(artist_id: @artist).page(params[:page]).per(10)
  end

  def order_send
  	artist = Artist.find(params[:id])
  	subscriptions = Subscription.where(artist_id: artist.id)
    subs = Subscription.where(artist_id: artist.id).pluck(:user_id)
    t_user = User.where(id: subs).where(is_active: true)
    tt_user = User.where(id: subs).where(is_active: true).pluck(:id)
    item = Item.where(artist_id: artist.id).order(created_at: :asc).last
    t_user.each do |t_user|
  	 shopping = ShoppingCart.new
  	 shopping.user_id = t_user.id
  	 shopping.is_active = false
  	 shopping.save
    end
    count = subs.count
    shopping_carts = ShoppingCart.where(user_id: tt_user).where(is_active: false).order(created_at: :asc)
    shopping_carts.last(count).each do |shopping|
     cart_item = CartItem.new
     cart_item.shopping_cart_id = shopping.id
     cart_item.item_id = item.id
     cart_item.price = item.price
     cart_item.quantity = 1
     cart_item.save
    end
    shopping_carts.last(count).each do |shopping|
      order = Order.new
      order.shopping_cart_id = shopping.id
      order.postal_code = shopping.user.postal_code
      order.address = shopping.user.address
      order.payment = 1
      order.status = 1
      order.save
    end
    subscriptions.each do |subscription|
      subscription.user.point += 100
      subscription.user.update(user_params)
    end
    redirect_to admin_index_path,flash: {notice: "定期購買を完了しました"}
  end

  private
  def user_params
    params.permit(:point)
  end
end