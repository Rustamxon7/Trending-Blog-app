class PostsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    @user = User.includes(:posts).find(current_user.id)
    @posts = Post.order(created_at: :desc).where(author_id: current_user.id)
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find(@post.author_id)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      flash[:notice] = 'Post successfully added!'
      redirect_to user_posts_path
    else
      render 'new'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.likes.destroy_all
    @post.comments.destroy_all
    @post.destroy
    flash[:notice] = @post.destroy ? 'Post successfully deleted!' : 'Post could not be deleted!'
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
