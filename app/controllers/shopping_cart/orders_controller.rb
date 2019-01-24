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
      # クレジットカード払いで登録してない方
      redirect_to new_user_credit_path, shopping_cart_id: params[:id]
    else
      # 銀行振込・クレジットカード払いで登録済みの方
      # orderテーブルの保存
      @order.postal_code = current_user.postal_code
      @order.address = current_user.address
      @order.shopping_cart_id = params[:id]
      @order.status = 1
      @order.save
      # cartitemテーブルのprice保存
      @cartitems = CartItem.where(shopping_cart_id: params[:id])
      @userpoint = current_user.point
      @cartitems.each do |f|
        f.price = f.item.price
        # point加算計算(1枚100点)
        @userpoint += 100
      end
      @cartitems.update(cartitem_params)
      # point合計保存
      current_user.point = @userpoint
      current_user.update(user_params)
      # shppingcartテーブルis_active falseに更新
      shoppingcart = ShoppingCart.find(params[:id])
      shoppingcart.is_active = false
      shoppingcart.update(shoppingcart_params)
      # 新規shoppingcartテーブル作成
      @shoppingcart = ShoppingCart.new
      @shoppingcart.user_id = current_user.id
      @shoppingcart.save
      redirect_to orders_confirmation_path(params[:id])
    end
  end

  private
  def order_params
    params.require(:order).permit(:payment)
  end
  def cartitem_params
    params.permit(:price)
  end
  def shoppingcart_params
    params.permit(:is_active)
  end
  def user_params
    params.permit(:point)
  end
end