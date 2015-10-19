class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Project, Reward]
    unless user.nil?
        can :manage, Project, :user_id => user.id
        can :manage, Reward, :project => { :user_id => user.id }
    end
  end
end



