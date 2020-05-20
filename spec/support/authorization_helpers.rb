require 'devise/jwt/test_helpers'

module AuthorizationHelpers
  def auth_headers(user)
    Devise::JWT::TestHelpers.auth_headers(json_headers, user)
  end

  def json_headers
    { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
  end
end
