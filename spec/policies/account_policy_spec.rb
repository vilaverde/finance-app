require 'rails_helper'

RSpec.describe AccountPolicy do

  subject { described_class }

  permissions :show?, :update? do
    context "as user" do
      it "grants access to account owner" do
        account = FactoryBot.create(:account)

        expect(subject).to permit(account.user, account)
      end

      it "denies access to random user" do
        random_user = FactoryBot.create(:user)
        account = FactoryBot.create(:account)

        expect(subject).not_to permit(random_user, account)
      end
    end
  end
end
