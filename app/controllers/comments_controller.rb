class CommentsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).all
  end

  def show
    @id = params[:id]
    @user = User.find(params[:user_id])
    @post_item = [params[:post_id].to_i - 1] if params[:id].to_i
  end

  def new
    @user=self.current_user
    @comment = @user.comments.new
    @post_item = [params[:post_id].to_i - 1]
  end

  # def create
  #     @post = Post.create(author: self.current_user, title: params[:post][:title], text: params[:post][:text],comments_counter:0,likes_counter:0)
  #     if(@post.new_record?)
  #     redirect_to '/users/1/comments/new', flash: { wrong: "Upps! Comment was not created." }
  #     else
  #     redirect_to '/users/1/comments/new', flash: { success: "Comment was successfully created." }
  #     end
  # end
end
