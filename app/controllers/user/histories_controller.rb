class User::HistoriesController < ApplicationController
  def all
    @histories = Order.includes(:shopping_cart => :user).where(users: {id: current_user.id}).page(params[:page])
  end

  def index
  	@order = Order.find(params[:id])
	  @history = ShoppingCart.includes(:items => :artist).where(:id => (params[:id]), :is_active => false ).page(params[:page])
    # 価格合計
    @pricesums = 0
    @history.each do |h|
      h.cart_items.each do |ci|
        @pricesums += (ci.price * ci.quantity)
      end
    end
  end

  def show
  	@history = CartItem.find(params[:id])
    if @history.shopping_cart.order.status == 1
      @status = "受付中"
    elsif @history.shopping_cart.order.status == 2
      @status = "商品準備中"
    else
      @status = "出荷済み"
    end
  end
end

