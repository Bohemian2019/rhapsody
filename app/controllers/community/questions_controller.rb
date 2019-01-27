class Community::QuestionsController < ApplicationController
  def index
    @community = Community.find(params[:id])
    @questions = Question.where(community_id: @community.id).page(params[:page]).per(10)
  end

  def delete
    question = Question.find(params[:question_id])
    if question.destroy
      flash[:notice] = "質問を削除しました"
      redirect_to community_question_index_path(params[:community_id])
    else
      flash[:notice] = "質問の削除に失敗しました"
      redirect_to community_question_index_path(params[:community_id])
    end
  end

  def new
  	@question = Question.new
  	@community = Community.find(params[:id])
  end

  def add
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.community_id = params[:id]
    if @question.save
       redirect_to community_qa_show_path(params[:id], @question.id)
    else
      @community = Community.find(params[:id])
      render :new
    end
  end


  private
  def question_params
    params.require(:question).permit(:question)
  end
end
