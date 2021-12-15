class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    @comment.save
    redirect_to user_posts_path(current_user)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to user_posts_path(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
