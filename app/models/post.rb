class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes
  validates :title, presence: true, length: { minimum: 5, maximum: 100 }
  validates :text, presence: true, length: { minimum: 10, maximum: 1000 }

  def recent_comments
    comments.order(created_at: :desc).limit(3)
  end

  def preview
    text.split("\n").first(2).join("\n")
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.update_attribute(:posts_counter, author.posts.count)
  end
end
