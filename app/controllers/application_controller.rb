class ApplicationController < ActionController::API
  include Errors::ApiErrorHandler

  before_action :authenticate_user!
end
