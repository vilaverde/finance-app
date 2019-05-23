require 'rails_helper'

RSpec.describe DeviseTokenAuth::SessionsController, type: :request do
  describe 'POST #create' do
    context 'with valid attributes' do
      it 'returns 200 http status code' do
        user = FactoryBot.create(:user)

        post '/auth/sign_in', params: {email: user.email, password: user.password}

        expect(response).to have_http_status(200)
      end

      it 'returns user data' do
        user = FactoryBot.create(:user)

        post '/auth/sign_in', params: {email: user.email, password: user.password}

        expect(json_body).to include(:data)
        expect(json_body[:data]).to include(:email)
      end

      it 'returns access-token' do
        user = FactoryBot.create(:user)

        post '/auth/sign_in', params: {email: user.email, password: user.password}

        expect(response.has_header?('access-token')).to eq(true)
      end
    end

    context 'with invalid attributes' do
      it 'returns 401 status code' do
        user = FactoryBot.create(:user)
        user_params = {
          "user": user.email,
          "password": "invalid" + user.password
        }

        post '/auth/sign_in', params: user_params

        expect(response).to have_http_status(401)
      end

      it 'returns validation errors' do
        user = FactoryBot.create(:user)
        user_params = {
          "user": user.email,
          "password": "invalid" + user.password
        }

        post '/auth/sign_in', params: user_params

        expect(json_body).to include(:errors)
      end
    end
  end
end
