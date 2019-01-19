class Community::QuestionsController < ApplicationController
  def index
  end

  def new
  	@question = Question.new
  	@community = Community.find(params[:id])
  end

  def add
    @question = Question.new(question_params)
    # 　後でcrrent_user.idに変更
    @question.user_id = 1
    @question.community_id = params[:id]
    @question.save
    redirect_to community_qa_show_path(params[:id], @question.id)
  end


  private
  def question_params
    params.require(:question).permit(:question)
  end
end
