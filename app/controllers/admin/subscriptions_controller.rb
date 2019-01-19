class Admin::SubscriptionsController < ApplicationController
  def index
  	@subscriptions = Subscription.all.page(params[:page]).per(10).order(:id)
  end

  def artist
  end
end
