class CommunitiesController < ApplicationController
  def show
  end

  def qa_show
  	@qa = Question.find(params[:question_id])
  	@answer = Answer.new
  	@answers = Answer.order(id: "DESC")
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
end
