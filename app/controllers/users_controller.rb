class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @post = Post.order(created_at: :desc).where(author_id: @user.id)
  end

  def destroy
    @user = User.find(params[:id])
    @user.likes.destroy_all
    @user.comments.destroy_all
    @user.posts.destroy_all
    @user.destroy
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :photo, :bio)
  end
end
