class User::CreditsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
  	@credit_card = CreditCard.new
  end

  def create
  	credit_card = CreditCard.new(credit_card_params)
    credit_card.user_id = current_user.id
     if credit_card.save
    flash[:success] = "登録しました"
      redirect_to shopping_cart_order_new(params[:shopping_cart.id])
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