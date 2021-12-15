class ApplicationController < ActionController::Base
  def current_user
    User.first
  end

  # show only one line of text for posts
  def text
    @post = Post.find(params[:id])
    @text = @post.text.split("\n").first
  end
end
