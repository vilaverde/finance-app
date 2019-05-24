class AccountPolicy < ApplicationPolicy
  def show?
    user.account == record
  end

  def update?
    user.account == record
  end
end
