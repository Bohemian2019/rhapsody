class User::HistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  def all
    @histories = Order.includes(:shopping_cart => :user).where(users: {id: current_user.id}).page(params[:page])
  end

  def index
    @order = Order.find(params[:id])
    @history = ShoppingCart.includes(:items => :artist).where(:id => (params[:id])).page(params[:page])
  end

  def show
  	@history = CartItem.find(params[:id])
  end
end
