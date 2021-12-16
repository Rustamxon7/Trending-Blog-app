require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'validations' do
    it 'validates the presence of the title' do
      post = Post.new
      expect(post).to_not be_valid
      expect(post.errors[:title]).to include("can't be blank")
    end

    it 'validates the length of the title' do
      post = Post.new(title: 'a' * 251)
      expect(post).to_not be_valid
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end

    #   validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  end
end
