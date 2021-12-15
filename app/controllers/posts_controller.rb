class PostsController < ApplicationController
  def index
    @user = current_user
    @posts = Post.where(author_id: current_user.id).order(created_at: :desc)
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

  # reset ids post_id when
  def reset_ids
    Post.all.each do |post|
      post.update_attribute(:post_id, post.id)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    flash[:notice] = if @post.destroy
                       'Post successfully deleted!'
                     else
                       'Post could not be deleted!'
                     end
    redirect_to user_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
