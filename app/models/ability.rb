class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    can :read, Recipe, public: true
    can :destroy, Recipe, user: user
    can :destroy, Food, user: user
    can %i[read create], :all
  end
end
