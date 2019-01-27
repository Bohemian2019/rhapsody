class Community::CommentsController < ApplicationController
  def add
    @board = BoardComment.new(boardcomment_params)
    @board.user_id = current_user.id
    @board.community_id = params[:id]
    if @board.save
       redirect_to communities_show_path(params[:id])
    else
       @community = Community.find(params[:id])
       @boards = BoardComment.all.where(community_id: @community.id).page(params[:page]).per(10).order(id: "DESC")
       render template: "communities/show"
    end
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
