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
    @community = Community.new
  end

  def create
    @community = Community.new(community_params)
    if @community.save
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
