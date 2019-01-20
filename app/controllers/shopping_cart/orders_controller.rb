class ShoppingCart::OrdersController < ApplicationController

  def new
  	@order = Order.find(params[:id])
  	@shoppingcarts = ShoppingCart.all
  	@items = @shoppingcarts.user_id
  	
  end

end
