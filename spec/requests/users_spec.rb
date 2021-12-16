require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /users' do
    it 'works! (now write some real specs)' do
      get users_path
      expect(response).to have_http_status(200)
    end

    it 'should return a list of users' do
      get users_path
      expect(response.body).to include('users-section')
    end
  end

  describe 'GET /users/new' do
    it 'should return a new user form' do
      get new_user_path
      expect(response.body).to include('Add User')
    end
  end

  describe 'POST /users' do
    it 'should create a new user' do
      post users_path, params: { user: { name: 'test', photo: 'test', bio: 'test' } }
      expect(response).to redirect_to(user_path(User.last))
    end
  end

  describe 'GET /users/:id' do
    it 'should return a user' do
      user = User.create(name: 'test', photo: 'test', bio: 'test')
      get user_path(user)
      expect(response.body).to include('test')
    end
  end
end
