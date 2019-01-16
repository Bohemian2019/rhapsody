class SearchController < ApplicationController
  def index
    @table_name = params[:table_name]

    if @table_name == 'Item'
      @artist = Artist
      @searched = Item.all
    elsif @table_name == 'User'
      @searched = User.all
    else
      @searched = Community.all
    end
  end
end
