class Admin::SubscriptionsController < ApplicationController
  def index
  	@subscriptions = Subscription.all.page(params[:page]).per(10).order(:id)
  end

  def artist
  	@artist = Artist.find(params[:id])
  	@subscription = Subscription.find_by(artist_id: @artist.id)
  	@user = User.where(id: @subscription.user_id).page(params[:page]).per(10)
  end
end
