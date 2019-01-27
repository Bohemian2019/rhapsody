class Admin::CommunitiesController < ApplicationController
  def new

  end

  def request_index
  	@community = Community.where(is_active: 'f').page(params[:page]).per(10)
  end

  def destroy
  	community = Community.find(params[:community_id])
    community.destroy
    redirect_to admin_communities_request_index_path
  end
end