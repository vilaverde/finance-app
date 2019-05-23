require 'rails_helper'

RSpec.describe DeviseTokenAuth::RegistrationsController, type: :request do
  describe 'POST #create' do
    context 'with valid params' do
      it 'returns 200 http status code' do
        user_params = {
          "email": "email@email.com",
          "password": "123456"
        }

        post '/auth/', params: user_params

        expect(response).to have_http_status(200)
      end

      it 'returns user data' do
        user_params = {
          "email": "email@email.com",
          "password": "123456"
        }

        post '/auth/', params: user_params

        expect(json_body).to include(:data)
        expect(json_body[:data]).to include(:uid)
        expect(json_body[:data]).to include(:email)
      end
    end

    context 'with invalid params' do
      it 'returns 422 status code' do
        user_params = {
          "email": "email@email.com"
        }

        post '/auth/', params: user_params

        expect(response).to have_http_status(422)
      end

      it 'returns validation errors' do
        user_params = {
          "email": "email@email.com"
        }

        post '/auth/', params: user_params

        expect(json_body).to include(:errors)
      end
    end
  end
end
