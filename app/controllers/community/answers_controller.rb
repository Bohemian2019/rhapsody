class Community::AnswersController < ApplicationController
  def add
  	@answer = Answer.new(answer_params)
    @answer.user_id = current_user.id
    @answer.question_id = params[:question_id]
    if @answer.save
       redirect_to community_qa_show_path
    else
      @qa = Question.find(params[:question_id])
      @community = Community.find(params[:id])
      @answers = @qa.answers.page(params[:page]).per(5).order(id: "DESC")
      render template: "communities/qa_show"
    end
  end

  def delete
    answer = Answer.find_by(id: params[:answer_id])
    answer.destroy
    redirect_to community_qa_show_path
  end

  private
  def answer_params
    params.require(:answer).permit(:answer)
  end

end