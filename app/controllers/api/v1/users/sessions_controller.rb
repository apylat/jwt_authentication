module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        include ActionController::MimeResponds

        respond_to :json
      end
    end
  end
end
