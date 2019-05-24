class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update]

  def show
    authorize @account

    json_response(@account, :ok)
  end

  def update
    authorize Account

    service = Accounts::Updater.new(current_user, @account, cte_params)
    result = service.call!

    json_response(result, :created)
  end

  private

  def set_account
    @account = current_user&.account
  end

  def update_params
    params.require(:account).permit(:status)
  end
end
