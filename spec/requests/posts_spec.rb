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
