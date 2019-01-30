class OrdersController < ApplicationController
  def show
    @order = ShoppingCart.find(params[:id])
  end
end
