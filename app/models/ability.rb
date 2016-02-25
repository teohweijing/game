class Ability
  include CanCan::Ability

  def initialize(user)
    if user.super_admin?
        can :manage, :all #account, application, request, role, user, promotion

    elsif user.admin?
        can :manage, Account
        can :manage, Application
        can :manage, Request
        can :manage, User
        can :manage, Promotion
        can :manage, Bank

    elsif user.regular?
        # can :manage, Request do |request|
        #     request.try(:user) == user
        # end
        can :read, Request
        can :create, Request
        can :update, Request do |request|
            request.try(:user) == user
        end
        can :destroy, Request do |request|
            request.try(:user) == user
        end
        can :read, Account do |account|
            account.try(:user) == user
        end
        can :read, Promotion
        can :read, Bank
    end
  end
end
