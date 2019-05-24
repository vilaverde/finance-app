require 'rails_helper'

RSpec.describe AccountsController, type: :request do
  describe "GET /account" do
    it "returns account data" do
      user = FactoryBot.create(:user)
      headers = login_headers(user.email, user.password)

      get "/account", headers: headers

      expect(response.body).not_to be_empty
      expect(json_body.keys).to include(:data)
      expect(json_body[:data].keys).to include(:status, :user_id)
    end

    it "returns success status" do
      user = FactoryBot.create(:user)
      headers = login_headers(user.email, user.password)

      get "/account", headers: headers

      expect(response.body).not_to be_empty
      expect(json_body.keys).to include(:status)
      expect(json_body[:status]).to eq("success")
    end

    it "returns status code 200" do
      user = FactoryBot.create(:user)
      headers = login_headers(user.email, user.password)

      get "/account", headers: headers

      expect(response).to have_http_status(200)
    end
  end

  describe "PUT /account" do
    pending "add some examples to #{__FILE__}"
  end
end
