class LikesController < ApplicationController
  def destroy
    like = current_user.likes.find_by(user_id: user.id)
    like.destroy
    redirect_to users_path
  end

  def create
    like = current_user.likes.new
    like.save
    redirect_to users_path
  end
end
