module Homeland::Note
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u
      if @user.blank?
        roles_for_anonymous
      elsif @user.roles?(:member)
        roles_for_members
      else
        roles_for_anonymous
      end
    end

    protected

    # 普通会员权限
    def roles_for_members
      can :create, Note
      can [:update, :destroy, :read], Note, user_id: user.id
      can :read, Note, publish: true
      basic_read_only
    end

    # 未登录用户权限
    def roles_for_anonymous
      cannot :manage, Note
      basic_read_only
    end

    def basic_read_only
      can :preview, Note
      can :read, Node
    end
  end
end
