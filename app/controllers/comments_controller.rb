class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      flash[:notice] = 'Comment successfully added!'
      redirect_to user_posts_path(current_user)
    else
      render :new
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    flash[:notice] = if @comment.destroy
                       'Comment successfully deleted!'
                     else
                       'Comment could not be deleted!'
                     end
    redirect_to user_posts_path(current_user)
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
