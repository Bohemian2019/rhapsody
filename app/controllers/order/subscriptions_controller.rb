class Order::SubscriptionsController < ApplicationController
  def new
    @community = Community.find(params[:community_id])
  end

  def add
    community = Community.find(params[:community_id])
    if CreditCard.where(user_id: current_user.id).empty? == true
      redirect_to new_user_credit_path(shopping_cart_id: 0, community_id: community.id)
    else
    subscription = Subscription.new
  	subscription.user_id = current_user.id
    subscription.artist_id = community.artist_id
    subscription.save
    #ポップアップで定期購買承りましたを表示
    redirect_to communities_show_path(community.id)
    end
  end


end