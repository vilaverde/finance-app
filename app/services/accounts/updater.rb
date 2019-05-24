module Accounts
  class Updater
    attr_reader :user, :account, :params

    def initialize(user, account, params)
      @user = user
      @account = account
      @params = params
    end

    def call!
      update_account!

      @account
    end

    private

    def update_account!
      account.update!(params)
    end
  end
end
