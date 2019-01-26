class ArtistsController < ApplicationController
  def new
    @artist = Artist.new

    #respond_to do |format|
    #  format.js
    #end
  end

  def create
    @artist = Artist.new(artist_params)

    if @artist.save
      #render json: { result: "ok", artist: @artist }
      flash[:notice] = "アーティストが登録されました。"
    else
      #render json: { result: "ng", msg: @artist.errors.messages }
      render :new
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:artist_name)
  end
end
