class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user || User.new

    can :destroy, Post, author: @user
    can :destroy, Comment, user_id: @user.id
    can :read, Post
    can :read, Comment
    can :create, Comment

    if @user.persisted?
      can :create, Post
      can :create, Comment
    end

    can :destroy, [Post, Comment] if @user.role.to_s.eql?('admin')
  end
end
