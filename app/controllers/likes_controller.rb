class LikesController < ApplicationController

  def destroy
    exercise_menu = ExerciseMenu.find(params[:exercise_menu_id])
    like = current_user.likes.find_by(exercise_menu_id: exercise_menu.id)
    like.destroy
    redirect_to exercise_menus_path
  end

  def create
    #binding.irb
    exercise_menu = ExerciseMenu.find(params[:exercise_menu_id])
    like = current_user.likes.new(exercise_menu_id: exercise_menu.id)
    like.save
    redirect_to exercise_menus_path
  end


end
