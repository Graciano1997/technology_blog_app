class User < ApplicationRecord
  has_many :comments, foreign_key: 'user_id'
  has_many :posts, foreign_key: 'author_id'
  has_many :likes, foreign_key: 'user_id'

  def show_post_user(user)
    Comment.where(user_id: user.id).last(3)
  end
end
