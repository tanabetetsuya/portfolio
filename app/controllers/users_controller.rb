class UsersController < ApplicationController
  def show
  end

  def edit
  end

  def index
    @users = User.all
    @comment = Comment.new
  end
end
