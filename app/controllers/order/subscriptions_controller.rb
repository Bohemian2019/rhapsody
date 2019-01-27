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
    my_community = UsersCommunity.new
    my_community.user_id = current_user.id
    my_community.community_id = community.id
    my_community.save
    redirect_to communities_show_path(community.id),flash: {notice: "定期購買を承りました"}
    end
  end
end