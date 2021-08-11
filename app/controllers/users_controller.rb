class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update]

  def show
    @user = current_user
    @exercise_menus = current_user.exercise_menus.all.page(params[:page]).per(5)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  def check
    @user = current_user
  end

  def resign
    @user =current_user
    @user.update(is_valid: "退会")
    reset_session
    redirect_to new_user_session_path
  end
  
  def index
    @user = User.all
  end

  def correct_user #他のユーザーの情報を編集できないように設定
    user = User.find(params[:id])
    if current_user != user
      redirect_to exercise_menus_path
    end
  end

  def user_params
    params.require(:user).permit(:name, :email, :profile_image, :is_valid)
  end
end
