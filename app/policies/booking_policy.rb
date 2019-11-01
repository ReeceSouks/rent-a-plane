class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.user == user
  end

  def show?
    record.user == user
  end

  def create?
    user.present?
  end
end
