class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  after_save :update_post_counter

  private

  def update_post_counter
    author.update_attribute(:posts_counter, author.posts.count)
  end
end 