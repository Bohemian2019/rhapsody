class Admin::OrdersController < ApplicationController
  def edit
  end

  def search
    @searched = Order.includes({:shopping_cart => {:items => :artist}},:shopping_cart =>  :user).page(params[:page])
    #@searched = Order.search(params[:keyword_item]).page(params[:page])
  end

  def show
  end
end
