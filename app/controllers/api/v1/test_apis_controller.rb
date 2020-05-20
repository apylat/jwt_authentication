module Api
  module V1
    class TestApisController < BaseApiController
      def index
        render json: { message: 'Successful response' }
      end
    end
  end
end
