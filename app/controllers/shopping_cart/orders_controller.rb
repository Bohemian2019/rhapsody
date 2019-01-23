class ShoppingCart::OrdersController < ApplicationController

  def new
    @order = Order.new
  	@shoppingcart = ShoppingCart.find(params[:id])
  	@cartitems = CartItem.where(shopping_cart_id: @shoppingcart.id)
    # 商品計算合計
  	@pricesums = 0
  	@cartitems.each do |f|
  		@pricesums += (f.item.price*f.quantity)
  	end
  end

  def sent
  	@order = Order.new(order_params)
    if @order.payment == 1 && CreditCard.where(user_id: current_user.id).empty? == true
      redirect_to new_user_credit_path
    else
      # orderテーブルの保存
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.shopping_cart_id = params[:id]
      @order.status = 1
      @order.save
      # cartitemテーブルのprice保存
      @cartitems = CartItem.where(shopping_cart_id: params[:id])
      @cartitems.each do |f|
        f.price = f.item.price
      end
      @cartitems.update(cartitem_params)

    end

  end

  private
  def order_params
    params.require(:order).permit(:payment)
  end
  def cartitem_params
    params.permit(:price)
  end
end
