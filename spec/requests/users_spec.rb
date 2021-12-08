require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /index' do
    it 'includes the user title index' do
      get '/users/index'
      expect(response.body).to include('User')
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/show'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'includes the user title show' do
      get '/users/show'
      expect(response.body).to include('User Title show')
    end
  end
end
