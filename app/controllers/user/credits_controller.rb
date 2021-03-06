class User::CreditsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def new
  	@credit_card = CreditCard.new
    @shopping = params[:shopping_cart_id]
    @community = params[:community_id]
  end

  def create
    shopping = params[:shopping_cart_id]
    community = params[:community_id]
  	credit_card = CreditCard.new(credit_card_params)
    credit_card.user_id = current_user.id
    if credit_card.save
      if community == "0"
        redirect_to shopping_cart_order_new_path(shopping)
      else
        redirect_to order_subscription_new_path(community_id: community)
      end
    else 
      flash[:notice] = "エラー：入力に誤りがあります"
      redirect_to new_user_credit_path(shopping_cart_id: shopping, community_id: community)
    end
  end

  private
  def credit_card_params
    params.require(:credit_card).permit(:name, :card_number, :month, :year)
  end
end