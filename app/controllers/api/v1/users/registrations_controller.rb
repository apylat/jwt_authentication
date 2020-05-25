module Api
  module V1
    module Users
      class RegistrationsController < Devise::RegistrationsController
        include Devise::ApiOnlyMixin
      end
    end
  end
end
