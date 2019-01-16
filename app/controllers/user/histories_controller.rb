class User::HistoriesController < ApplicationController
  def all
  end

  def index
  end

  def show
  	@histry = CartItem.find(params[:id])
  end
end
