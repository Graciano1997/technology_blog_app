class LikesController < ApplicationController
  def create
    @like = Like.create(user: @user, post_id: params[:post_item_id])
    if @like.new_record?
      puts 'can not like'
    else
      puts 'One more like'
    end
    # @like = Like.create(user: current_user, post_id: params[:post_item_id])
    # if @like.new_record?
    #   puts 'can not like'
    # else
    #   puts 'One more like'
    # end
  end
end




