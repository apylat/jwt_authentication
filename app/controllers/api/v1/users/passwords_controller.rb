module Api
  module V1
    module Users
      class PasswordsController < Devise::PasswordsController
        include Devise::ApiOnlyMixin
      end
    end
  end
end
