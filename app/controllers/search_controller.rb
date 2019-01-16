class SearchController < ApplicationController
  def index
    @table_name = params[:table_name]

    if @table_name == 'Item'
      @artist = Artist
      @searched = Item.search(params[:keyword]).page(params[:page])
    elsif @table_name == 'User'
      @searched = User.search(params[:keyword]).page(params[:page])
    else
      @searched = Community.search(params[:keyword]).page(params[:page])
    end
  end
end
