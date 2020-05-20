require "rails_helper"

RSpec.describe 'Users Registration', type: :request do
  let(:user) { create(:user) }

  let(:user_params) do
    {
      user: {
        email: 'example@email.com',
        password: 'password'
      }
    }
  end

  describe 'User sign up' do
    context 'valid params' do
      it 'creates user and returns Authorization header' do
        expect {
          post '/api/v1/users', params: user_params.to_json, headers: json_headers
        }.to change { User.count }.by(1)

        expect(response).to have_http_status(:created)
        expect(response.headers).to have_key("Authorization")
      end
    end

    context 'invalid params' do
      it 'returns unprocessable_entity status code' do
        user_params[:user].merge!(email: user.email)

        expect {
          post '/api/v1/users', params: user_params.to_json, headers: json_headers
        }.to change { User.count }.by(0)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'User update' do
    context 'valid params' do
      it 'updates user' do
        user_params[:user][:current_password] = 'password'
        patch '/api/v1/users', params: user_params.to_json, headers: auth_headers(user)

        user.reload
        expect(response).to have_http_status(:no_content)
        expect(user.email).to eq(user_params[:user][:email])
      end
    end

    context 'invalid params' do
      it 'returns unprocessable_entity status code without current password' do
        patch '/api/v1/users', params: user_params.to_json, headers: auth_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'User destroy' do
    context 'valid params' do
      it 'deletes user' do
        delete '/api/v1/users', headers: auth_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
