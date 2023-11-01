class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'user_id'

  def user_recent_posts()
    Post.order('created_at Desc').limit(3)
  end
end
