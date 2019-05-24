class AccountsController < ApplicationController
  before_action :set_account, only: [:show]

  def show
    authorize @account

    json_response(@account, :ok)
  end

  private

  def set_account
    @account = current_user&.account
  end
end
