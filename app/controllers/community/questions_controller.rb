class Community::QuestionsController < ApplicationController
  def index
    @community = Community.find(params[:id])
    @questions = Question.where(community_id: @community.id).page(params[:page]).per(10)
  end

  def delete
    @question = Question.find(params[:id])
    if @question.destroy
      flash[:notice] = "successfully access"
      redirect_to community_question_index_path(params[:id])
    else
      flash[:notice] = "can't successfully access"
      redirect_to user_path(current_user.id)
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
