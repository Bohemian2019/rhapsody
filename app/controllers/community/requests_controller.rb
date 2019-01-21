class Community::RequestsController < ApplicationController

  def new
    @request = Community.new
  end

  def create 
    @request = Community.new(community_params)
    if @request.save
      redirect_to root_path 
      flash[:notice] = "コミュニティリクエストを受け付けました"
    else
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(:artist_id, :name, :introduction)
  end
end
