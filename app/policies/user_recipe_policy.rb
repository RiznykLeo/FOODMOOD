class UserRecipePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def cart?
    true
  end

  def cookbook?
    true
  end

  def destroy?
    true
  end

  def cookbook?
    true
  end
end
