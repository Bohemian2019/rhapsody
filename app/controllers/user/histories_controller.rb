class User::HistoriesController < ApplicationController
  def all
  end

  def index
  end

  def show
  	@history = CartItem.find(params[:id])
  end
end
