# frozen_string_literal: true

module Errors
  class ErrorFormatter
    def self.as_json(message, errors = [])
      {
        message: message,
        errors: errors
      }
    end
  end
end
