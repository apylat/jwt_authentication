module Api
  module V1
    module Users
      class SessionsController < Devise::SessionsController
        include Devise::ApiOnlyMixin
      end
    end
  end
end
