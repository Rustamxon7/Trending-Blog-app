require 'rails_helper'

RSpec.describe User, type: :model do
  user = User.new(name: 'Rustamjon', bio: 'I am a programmer', posts_counter: 0, photo: 'https://avatars.mds.yandex.net/get-pdb/16058/9c9f9f5c-f9c9-4f0f-a9f0-f8f9f9f9f9f9f/s1200?webp=false')

  before(:each) { user.save }

  it 'validates the presence of the name' do
    user.name = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the posts_counter' do
    user.posts_counter = nil
    expect(user).to_not be_valid
  end

  it 'validates the numericality of the posts_counter' do
    user.posts_counter = 'a'
    expect(user).to_not be_valid
  end

  it 'validates the presence of the bio' do
    user.bio = nil
    expect(user).to_not be_valid
  end

  it 'validates the presence of the photo' do
    user.photo = nil
    expect(user).to_not be_valid
  end

  describe '#recent_posts' do
    before(:each) do
      5.times do |i|
        Post.new(title: "Post #{i}", text: "text#{i}", comments_count: 0, likes_count: 0, author_id: user.id)
      end
    end

    it 'returns the last 3 posts' do
      expect(user.recent_posts).to eq(Post.order(created_at: :desc).limit(3))
    end
  end
end
