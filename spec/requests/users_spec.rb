require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'validations' do
    it 'validates the presence of the name' do
      user = User.new
      expect(user).to_not be_valid
      expect(user.errors[:name]).to include("can't be blank")
    end

    it 'validates the posts_counter' do
      user = User.new(posts_counter: -1)
      expect(user).to_not be_valid
      expect(user.errors[:posts_counter]).to include('must be greater than or equal to 0')
    end
  end
end
