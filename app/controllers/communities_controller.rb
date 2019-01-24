class CommunitiesController < ApplicationController
  def show
    @community = Community.find(params[:id])
    @boards = BoardComment.all.page(params[:page]).per(10).order(id: "DESC")
    @board = BoardComment.new
  end

  def qa_show
  	@qa = Question.find(params[:question_id])
    @community = Community.find(params[:id])
  	@answer = Answer.new
  	@answers = @qa.answers.page(params[:page]).per(5).order(id: "DESC")
  end

  def delete
    if current_user.admin == true
      @community = Community.find(params[:id])
      @community.destroy
      redirect_to search_index_path
      flash[:notice] = "Community was successfully destroyed"
    else
      redirect_to search_index_path
    end
  end

  def new
    #@community_request = CommunityRequestForm.new
    @community = Community.new
  end

  def create
    #@community_request = CommunityRequestForm.new(community_request_params)
    #artist_id = Artist.find_by(artist_name: @community.artist_name).id
    #community = Community.new(name: @community_request.name,
    #                          artist_id: artist_id,
    #                          introduction: @community_request.introduction)
    #formからattributesを取得して、それを元にデータベースに追加
    @community = Community.new(community_params)
    if Artist.exists?(artist_name: @community.artist_name)
      @community[:artist_id] = Artist.find_by(artist_name: @community.artist_name).id
    end
    @community[:name] = @community.name
    @community[:introduction] = @community.introduction
    if @community.save
      redirect_to root_path 
      flash[:notice] = "コミュニティリクエストを受け付けました"
    else
      render :new
    end
  end

  private

  def community_params
    params.require(:community).permit(:artist_name, :name, :introduction)
  end
end
