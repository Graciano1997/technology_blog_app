class Like < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  belongs_to :post, foreign_key: 'post_id'

  def like_counter_update(post)
    post_object = Post.where(id: post.id)[0]
    if post_object.likes_counter.nil?
      Post.where(id: post.id).update(likes_counter: 1)
    else
      Post.where(id: post.id).update(likes_counter: post_object.likes_counter + 1)
    end
  end
end
