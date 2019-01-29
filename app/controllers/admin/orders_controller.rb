class Admin::OrdersController < ApplicationController
  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
       redirect_to admin_order_path(params[:id])
    else
       render :edit
    end
  end

  def search
    @searched = Order.search(params[:keyword_artist], params[:keyword_item]).page(params[:page])
    @orders = Order.search(params[:keyword_artist], params[:keyword_item])
  end

  def update_status
    @orders = Order.search(params[:keyword_artist], params[:keyword_item])
    
    if @orders.update_all(status: params[:order][:status])
      redirect_to admin_index_path
      flash[:notice] = "受注ステータスを更新しました。"
    else
      render :search
    end
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

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :status)
  end
end
