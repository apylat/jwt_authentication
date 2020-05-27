# frozen_string_literal: true

module Devise
  class CustomFailureApp < Devise::FailureApp
    def http_auth_body
      return super unless request_format == :json

      Errors::ErrorFormatter
        .as_json(i18n_message)
        .to_json
    end
  end
end
