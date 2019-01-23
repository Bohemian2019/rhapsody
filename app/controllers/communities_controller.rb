class CommunitiesController < ApplicationController
  def show
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
    @community_request = CommunityRequestForm.new
    @community = Community.new
  end

  def create
    @community_request = CommunityRequestForm.new(community_request_form_params)
    @community = Community.new
    if Artist.exists?(artist_name: @community_request.artist_name)
      @community[:artist_id] = Artist.find_by(artist_name: @community_request.artist_name).id
    else
      @community[:artist_id] = 0
    end
    @community[:name] = @community_request.name
    @community[:introduction] = @community_request.introduction
    if @community.save
      redirect_to root_path 
      flash[:notice] = "コミュニティリクエストを受け付けました"
    else
      render :new
    end
  end

  private

  def community_request_form_params
    params.require(:community_request_form).permit(:artist_name, :name, :introduction)
  end
end
