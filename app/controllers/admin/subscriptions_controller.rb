class Admin::SubscriptionsController < ApplicationController
  def index
  	@subscriptions = Subscription.all.page(params[:page]).per(10).order(:id)
  end

  def artist
  	@artist = Artist.find(params[:id])
  	@subscription = Subscription.where(artist_id: @artist).page(params[:page]).per(10)
  end

  def order_send

    #やりたいこと=> subscriptionをもとにshopping_cartの作成、carts_itemの作成、orderの作成

    #ある1名のアーティスト
  	artist = Artist.find(params[:id])
    #artistが一致する定期購買（複数）
  	subscriptions = Subscription.where(artist_id: artist.id)
    #artistの最新作
    item = Item.where(artist_id: artist.id).order(created_at: :asc).last

    #ショッピングカート(id, user_id , is_active)
    subscriptions.each do |subscription|
  	 shopping = ShoppingCart.new
  	 shopping.user_id = subscription.user_id
  	 shopping.is_active = false
  	 shopping.save
    end

    #！問題点！whereからwhereを探せない
    shopping_carts = ShoppingCart.where(user_id: subscriptions.user_id).where(is_active: false)

    #カートとアイテムの中間テーブル（id,shopping_cart_id,item_id,price,quantity)
    shopping_carts.each do |shopping|
     cart_item = CartItem.new
     cart_item.shopping_cart_id = shopping.id
     cart_item.item_id = item.id
     cart_item.price = item.price
     cart_item.quantity = 1
     cart_item.save
    end

    #注文(id, shopping_cart_id, postal_code, address, payment, status)
    subscriptions.each do |subscription|
      order = Order.new
      order.shopping_cart_id = subscriptions.user.shopping.id
      order.postal_code = subscriptions.user.postal_code
      order.address = subscriptions.user.address
      order.payment = 1
      order.status = 1
      order.save
    end
    redirect_to admin_index_path,flash: {notice: "定期購買を完了しました"}
  end
end




    artist = Artist.find(params[:id])
    #first変更
    subscription = Subscription.where(artist_id: artist.id).first
    shopping = ShoppingCart.new
    shopping.user_id = subscription.user_id
    shopping.is_active = false
    shopping.save
    item = Item.where(artist_id: artist.id).order(created_at: :asc).last
    carts_items = CartItem.new
    carts_items.shopping_cart_id = shopping.id
    carts_items.item_id = item.id
    carts_items.price = item.price
    carts_items.quantity = 1
    carts_items.save
    order = Order.new
    order.shopping_cart_id = shopping.id
    order.postal_code = subscription.user.postal_code
    order.address = subscription.user.address
    order.payment = 1
    order.status = 1
    order.save
    redirect_to admin_index_path,flash: {notice: "定期購買を完了しました"}