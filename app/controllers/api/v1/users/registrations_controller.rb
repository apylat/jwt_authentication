module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        include ActionController::MimeResponds

        respond_to :json
      end
    end
  end
end
