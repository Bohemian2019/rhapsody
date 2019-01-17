class CommunitiesController < ApplicationController
  def show
  end

  def qa_show
  	@qa = Question.find(params[:question_id])
  	@answer = Answer.new
  	@answers = Answer.order(id: "DESC")
  end
end
