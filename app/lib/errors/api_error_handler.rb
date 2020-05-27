# frozen_string_literal: true

module Errors
  module ApiErrorHandler
    def self.included(klass)
      klass.class_eval do
        rescue_from StandardError do |e|
          render api_error(e, :internal_server_error)
        end

        rescue_from ActiveRecord::ActiveRecordError do |e|
          message = "#{e.record.class}::#{e.message}"

          render unprocessable_entity_error(e.record, message)
        end

        rescue_from ActiveRecord::RecordNotFound do |e|
          render api_error(e, :not_found)
        end

        rescue_from ActionController::ParameterMissing do |e|
          render api_error(e, :bad_request)
        end
      end
    end

    def unprocessable_entity_error(resource, message = 'Unprocessable entity')
      json_error(message, :unprocessable_entity, resource.errors.messages)
    end

    def api_error(error, status)
      json_error(error.message, status)
    end

    def json_error(message, status, errors = [])
      {
        json: Errors::ErrorFormatter.as_json(message, errors),
        status: status
      }
    end
  end
end
