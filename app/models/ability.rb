class Ability
  include CanCan::Ability

  def initialize(user)
    can :new, School
    can :manage, School, user_id: user.id
  end
end
