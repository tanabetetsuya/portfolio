class CommentsController < ApplicationController
  def create
    #binding.irb
    exercise_menu = ExerciseMenu.find(params[:exercise_menu_id])
    comment = Comment.new(comment_params)
    comment.user_id = current_user.id
    comment.exercise_menu_id = exercise_menu.id
    comment.save
    redirect_to exercise_menus_path
  end

  def destroy
  end

  def index
    @comments = Comment.all
  end

  private
  def comment_params
    params.require(:comment).permit(:user_id, :exercise_menu_id, :rate, :comment)
  end
end
