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
    item = Item.where(artist_id: artist.id).order(created_at: :asc).last
    subscriptions.each do |subscription|
  	 shopping = ShoppingCart.new
  	 shopping.user_id = subscription.user_id
  	 shopping.is_active = false
  	 shopping.save
    end
    shopping_carts = ShoppingCart.where(user_id: subs).where(is_active: false).pluck(:id)
    shopping_carts.each do |shopping|
     cart_item = CartItem.new
     cart_item.shopping_cart_id = shopping.id
     cart_item.item_id = item.id
     cart_item.price = item.price
     cart_item.quantity = 1
     cart_item.save
    end
    shopping_carts.each do |shopping|
      order = Order.new
      order.shopping_cart_id = shopping.id
      order.postal_code = shopping.user.postal_code
      order.address = shopping.user.address
      order.payment = 1
      order.status = 1
      order.save
    end
  end
end