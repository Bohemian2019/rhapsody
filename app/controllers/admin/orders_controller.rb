class Admin::OrdersController < ApplicationController
  def edit
  end

  def search
    @searched = CartItem.search(params[:keyword_artist], params[:keyword_item]).page(params[:page])
    @orders = Order.search(params[:keyword_artist], params[:keyword_item])
  end

  def update
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
    @status = @order.status
    if @status == 1
      puts "受注"
    elsif @status == 2
      puts "準備中"
    else
      puts "完了"
    end
    @payment = @order.payment
    if @payment == 1
      puts "クレジットカード"
    else
      puts "銀行振込"
    end
    @total = @cart.price * @cart.quantity
  end

  private
  def order_params
    params.require(:order).permit(:postal_code, :address, :status)
  end
end

