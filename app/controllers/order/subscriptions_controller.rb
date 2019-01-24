class Order::SubscriptionsController < ApplicationController
  def new
    @community = Community.find(params[:id])
  end

  def create
    community = Community.find(params[:id])
    if CreditCard.where(user_id: current_user.id).empty? == true
      redirect_to new_user_credit_path(shopping_cart_id: 0, commuity_id: params[:id])
    else
    subscripiton = Subscription.new(subscripiton_params)
  	subscripiton.user_id = current_user.id
    subscripiton.artist_id = community.artist_id
    subscription.save
    #ポップアップで定期購買承りましたを表示
    redirect_to community_show_path(@community)
    end
  end

  private
  def subscription_params
    params.require(:subscription).permit(:user_id, :artist_id)
  end
end