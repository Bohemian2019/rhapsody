class ShoppingCartsController < ApplicationController
  def show
	  @cart_items = CartItem.includes(:item => :artist).where(:shopping_cart_id => (params[:id]))
    @cart_item = CartItem.new

    # 価格合計
    @pricesums = 0
    @cart_items.each do |ci|
        @pricesums += (ci.item.price * ci.quantity)
    end
  end

  def update
    ci = CartItem.find(params[:ci_id])
    if params[:status] == "0"
      ci.quantity += 1
      ci.save
    else
      ci.quantity -= 1
      ci.save
    end
    redirect_to shopping_cart_show_path(params[:id])
  end

  def destroy
	 ci = CartItem.find(params[:ci_id])
	 ci.destroy
	 redirect_to shopping_cart_show_path(params[:id])
  end
end
