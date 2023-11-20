class Ability
  include CanCan::Ability

  def initialize(user)
    @user = user
    can :destroy, Post, author: @user
    can(:destroy, Comment, user:)
    can :read, Post
    can :read, Comment

    if @user.persisted?
      can :create, Post
      can :create, Comment
    end

    can :destroy, [Post, Comment] if @user.role.to_s.eql?('admin')
  end
end
