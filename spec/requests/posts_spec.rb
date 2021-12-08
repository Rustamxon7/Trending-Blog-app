require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/users/index/posts/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "includes the post title index" do
      get "/users/index/posts/index"
      expect(response.body).to include("Post Title")
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get "/users/index/posts/show"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "includes the post title show" do
      get "/users/show/posts/show"
      expect(response.body).to include("Post Title show")
    end
  end
end
