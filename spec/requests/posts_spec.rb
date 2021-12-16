# class PostsController < ApplicationController
#   def index
#     @user = current_user
#     @posts = Post.where(author_id: current_user.id).order(created_at: :desc)
#   end

#   def show
#     @post = Post.find(params[:id])
#     @user = User.find(@post.author_id)
#   end

#   def new
#     @post = Post.new
#   end

#   def create
#     @post = Post.new(post_params)
#     @post.author_id = current_user.id
#     if @post.save
#       flash[:notice] = 'Post successfully added!'
#       redirect_to user_posts_path
#     else
#       render 'new'
#     end
#   end

#   def destroy
#     @post = Post.find(params[:id])
#     flash[:notice] =
#       if @post.destroy
#         'Post successfully deleted!'
#       else
#         'Post could not be deleted!'
#       end
#     redirect_to user_posts_path
#   end

#   private

#   def post_params
#     params.require(:post).permit(:title, :text)
#   end
# end

require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /posts' do
    before do
      @user = User.create(name: 'test', photo: 'test', bio: 'test')
      @post = Post.create(title: 'test', text: 'test', author_id: @user.id)
    end

    it 'works! (now write some real specs)' do
      get posts_path
      expect(response).to have_http_status(200)
    end

    it 'should return a list of posts' do
      get posts_path
      expect(response.body).to include('posts-page')
    end

    it 'should return a list of posts' do
      get posts_path
      expect(response.body).to include('test')
    end
  end
end
