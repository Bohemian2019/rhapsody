class Order::SubscriptionsController < ApplicationController
  def new
  	@subscription = Subscription.new
    @community = Community.where(id: '1').first
  end

  def create
  	@subscripiton = Subsctiption.new(subscription_params)
  	@subscripiton.user_id = current_user.id
     if @credit_card.save
    flash[:success] = "登録しました"
      redirect_to orders_confirmation_path(orders[:id])
    else
      flash[:danger] = "登録に失敗しました"
      render :new
  	end
  end

  private
  def credit_card_params
    params.require(:credit_card).permit(:name, :card_number, :month, :year)
  end
end
