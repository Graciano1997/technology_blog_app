class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def post_counter_update(user)
    user_object = User.where(id: user.id)[0]
    if user_object.posts_counter.nil?
      User.where(id: user.id).update(posts_counter: 1)
    else
      User.where(id: user.id).update(posts_counter: user_object.posts_counter + 1)
    end
  end

  def show_post_comments(post)
    Comment.where(post_id: post.id).last(5)
  end
end
