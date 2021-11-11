class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipe, public: true
    can %i[destroy read], Recipe, user: user
    can :destroy, Food, user: user
    can :read, Food
    can :create, :all
  end
end
