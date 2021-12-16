class ApplicationController < ActionController::Base
  def current_user
    @user = User.first
  end

  def text
    @post = Post.find(params[:id])
    @text = @post.text.split("\n").first
  end
end
