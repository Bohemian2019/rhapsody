class Admin::CommunitiesController < ApplicationController
  def new
    @community = Community.where(id: params[:id])
  end

  def update
    community = Community.find(params[:id])
    count = Community.where(artist_id: community.artist_id).where(is_active: true).count
    # communityをアーティストで検索、②以上であればエラー
    if count >= 2
      flash[:notice] = "当該アーティストにはすでにコミュニティが存在します"
      @community = Community.where(id: params[:id])
      render :new
    else
      if community.update!(community_params)
        community.update(is_active: true)
        redirect_to admin_communities_request_index_path
        flash[:notice] = "コミュニティの新規登録が完了しました"
      else
        @community = Community.where(id: params[:id])
        render :new
      end
    end
  end

  def request_index
  	@community = Community.where(is_active: 'f').page(params[:page]).per(10)
  end

  def destroy
  	community = Community.find(params[:community_id])
    community.destroy
    redirect_to admin_communities_request_index_path
  end

  def community_params
    params.require(:community).permit(:name, :introduction)
  end

end