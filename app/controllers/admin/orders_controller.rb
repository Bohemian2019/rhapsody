class Admin::OrdersController < ApplicationController
  def edit
  end

  def search
    @searched = Order.includes({:shopping_cart => {:items => :artist}},:shopping_cart =>  :user).page(params[:page])
    @searched = Order.search(params[:keyword_item]).page(params[:page])
  end

  def show
    @order = Order.find(params[:id])
    @cart = CartItem.where(shopping_cart_id: @order.shopping_cart_id).first
    @shopping = ShoppingCart.where(id: @order.shopping_cart_id).first
    @item = Item.where(id: @cart.item_id)
    @user = User.where(id: @shopping.user_id).first
    @credit = CreditCard.where(user_id: @user.id).first
    @total = @cart.price * @cart.quantity
  end
end