class LikesController < ApplicationController
  before_action :find_post

  def create
    @post.likes.create(author_id: current_user.id)
    flash[:notice] = 'You liked this post!'
    redirect_to root_path
  end

  def destroy
    @like = @post.likes.find(params[:id])
    @like.destroy
    redirect_to root_path
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
