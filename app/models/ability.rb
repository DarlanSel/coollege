class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, School, user_id: user.id
  end
end
