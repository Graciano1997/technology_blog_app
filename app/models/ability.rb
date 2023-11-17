# frozen_string_literal: true

class Ability
  include CanCan::Ability
  def initialize(user)
    can :destroy, Post, author: user
    can :destroy, Comment, user: user
    return unless user.role.to_s.eql?("admin")
    can :destroy, [Post,Comment]
  end
end
