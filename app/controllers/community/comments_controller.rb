class Community::CommentsController < ApplicationController
  def add
    @comment = BoardComment.new(boardcomment_params)
    @comment.user_id = current_user.id
    @comment.community_id = params[:id]
    @comment.save
    redirect_to communities_show_path(params[:id])
  end

  def delete
    boardcomment = BoardComment.find_by(id: params[:board_comment_id])
    boardcomment.destroy
    redirect_to communities_show_path(params[:id])
  end


  private
  def boardcomment_params
    params.require(:board_comment).permit(:comment)
  end
end
