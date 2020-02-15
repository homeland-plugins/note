# frozen_string_literal: true

module Homeland::Note
  class Ability
    include CanCan::Ability

    attr_reader :user

    def initialize(u)
      @user = u
      if @user.blank?
        roles_for_anonymous
      else
        roles_for_members
      end
    end

    protected

    # 普通会员权限
    def roles_for_members
      can :create, Note
      can %i[update destroy read], Note, user_id: user.id
      can :read, Note, publish: true
      basic_read_only
    end

    def basic_read_only
      can :preview, Note
      can :read, Node
    end
  end
end
