require 'rails_helper'

# class Post < ApplicationRecord
#   belongs_to :author, class_name: 'User'
#   has_many :comments
#   has_many :likes
#   validates :title, presence: true, length: { maximum: 250 }
#   validates :comments_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
#   validates :likes_count, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

#   def recent_comments
#     comments.order(created_at: :desc).limit(3)
#   end

#   def preview
#     text.split("\n").first(2).join("\n")
#   end

#   after_save :update_post_counter

#   private

#   def update_post_counter
#     author.update_attribute(:posts_counter, author.posts.count)
#   end
# end

RSpec.describe Post, type: :model do
  user = User.new(name: 'Rustamjon', bio: 'I am a programmer', posts_counter: 0, photo: 'https://avatars.mds.yandex.net/get-pdb/16058/9c9f9f5c-f9c9-4f0f-a9f0-f8f9f9f9f9f9f/s1200?webp=false')
  post = Post.new(title: 'Post 1', text: 'text1..', comments_count: 0, likes_count: 0, author_id: user.id)

  before(:each) { post.save }

  it 'validates the presence of the title' do
    post.title = nil
    expect(post).to_not be_valid
  end

  it 'validates the presence of the text' do
    post.text = nil
    expect(post).to_not be_valid
  end

  it 'validates the presence of the comments_count' do
    post.comments_count = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the comments_count' do
    post.comments_count = 'a'
    expect(post).to_not be_valid
  end

  it 'validates the presence of the likes_count' do
    post.likes_count = nil
    expect(post).to_not be_valid
  end

  it 'validates the numericality of the likes_count' do
    post.likes_count = 'a'
    expect(post).to_not be_valid
  end

  it 'validates the presence of the author_id' do
    post.author_id = nil
    expect(post).to_not be_valid
  end

  describe '#recent_comments' do
    before(:each) { 5.times { |i| Comment.new(text: "Comment #{i}", post_id: post.id) } }

    it 'returns the last 3 comments' do
      expect(post.recent_comments).to eq(Comment.order(created_at: :desc).limit(3))
    end
  end
end
