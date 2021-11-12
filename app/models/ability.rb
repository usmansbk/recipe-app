class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipe, public: true
    can :manage, Recipe, user: user
    can :manage, Food, user: user
    can :manage, Inventory, user: user
    can :read, Food
    can :create, :all
  end
end
