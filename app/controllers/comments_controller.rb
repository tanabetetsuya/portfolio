class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect users_path
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
