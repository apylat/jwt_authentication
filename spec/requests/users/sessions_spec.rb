# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session', type: :request do
  let(:user_password) { 'valid_password' }
  let(:user) { create(:user, password: user_password) }

  let(:valid_params) do
    {
      user: {
        email: user.email,
        password: user_password
      }
    }.to_json
  end

  let(:invalid_params) do
    {
      user: {
        email: user.email,
        password: 'invalid_password'
      }
    }.to_json
  end

  describe 'Sign in' do
    context 'valid params' do
      it 'sign in user and returns Authorization header' do
        post '/api/v1/users/sign_in', params: valid_params, headers: json_headers

        expect(response).to have_http_status(:created)
        expect(response.headers).to have_key('Authorization')
      end
    end

    context 'invalid params' do
      it 'sign in user and returns Authorization header' do
        post '/api/v1/users/sign_in', params: invalid_params, headers: json_headers

        expect(response).to have_http_status(:unauthorized)
      end
    end
  end

  describe 'Sign Out' do
    context 'with Authorization header' do
      it 'adds JWT to the JwtBlacklist table' do
        expect do
          delete '/api/v1/users/sign_out', headers: auth_headers(user)
        end.to change { JwtBlacklist.count }.by(1)

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'without Authorization header' do
      it 'returns no content http status' do
        expect do
          delete '/api/v1/users/sign_out', headers: json_headers
        end.to change { JwtBlacklist.count }.by(0)

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
