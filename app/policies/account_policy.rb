class AccountPolicy < ApplicationPolicy
  def show?
    user.account == record
  end
end
