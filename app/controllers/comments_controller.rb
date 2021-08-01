class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    #binding.irb
    exercise_menu = ExerciseMenu.find(params[:exercise_menu_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.exercise_menu_id = exercise_menu.id
    comment.save
    redirect_to exercise_menu_comments_path(exercise_menu.id)
  end

  def destroy
  end

  def index
    @exercise_menu = ExerciseMenu.find(params[:exercise_menu_id])
    @comment = Comment.new
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :exercise_menu_id, :comment)
  end
end
