class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  after_save :update_post_counter

  private

  def update_post_counter
    User.increment!(:posts_counter)
  end

  def show_post_comments(post)
    Comment.where(post_id: post.id).last(5)
  end
end
