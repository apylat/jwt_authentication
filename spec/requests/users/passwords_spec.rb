require "rails_helper"

RSpec.describe 'Passwords', type: :request do
  let(:user) { create(:user) }

  let(:reset_password_valid_params) do
    {
      user: {
        email: user.email
      }
    }.to_json
  end

  let(:reset_password_invalid_params) do
    {
      user: {
        email: 'not_email@example.com'
      }
    }.to_json
  end

  let(:confirm_reset_params) do
    {
      user: {
        reset_password_token: user.send(:set_reset_password_token),
        password: 'new_password',
        password_confirmation: 'new_password'
      }
    }.to_json
  end

  let(:confirm_reset_invalid_params) do
    {
      user: {
        reset_password_token: 'invalid_token',
        password: 'new_password',
        password_confirmation: 'new_password'
      }
    }.to_json
  end

  describe 'Reset Password Request' do
    context 'valid params' do
      it 'sends reset password email' do
        post '/api/v1/users/password', params: reset_password_valid_params, headers: json_headers

        expect(response).to have_http_status(:created)
      end
    end

    context 'invalid params' do
      it 'returns unprocessible entity response status' do
        post '/api/v1/users/password', params: reset_password_invalid_params, headers: json_headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'Confirm Password Reset' do
    context 'with valid reset password token' do
      it 'changes user password' do
        patch '/api/v1/users/password', params: confirm_reset_params, headers: json_headers

        expect(response).to have_http_status(:no_content)
      end
    end

    context 'with valid reset password token' do
      it 'returns unprocessible entity response status' do
        patch '/api/v1/users/password', params: confirm_reset_invalid_params, headers: json_headers

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
