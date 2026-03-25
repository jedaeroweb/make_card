class UserAbility
  include CanCan::Ability

  def initialize(user)
    cannot :manage, :all
    can :read, [User]
    if user
      can :manage, [User,Market ,Job, Question, Answer, Blog]
      can :read, []
      can :create, [Company]
      unless user.companies_count.zero?
        can :manage, [ Company]
      end
    end
  end
end
