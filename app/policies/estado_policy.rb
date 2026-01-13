class EstadoPolicy < ApplicationPolicy
  def index?
    admin?
  end

  def show?
    false
  end

  def create?
    admin?
  end

  class Scope < ApplicationPolicy::Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  private

  def admin?
    user.present? && user.admin?
  end
end
