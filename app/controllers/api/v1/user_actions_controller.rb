module Api
  module V1
    class UserActionsController < BaseApiController
      def index
        render json: format_json_output(UserAction.recent)
      end
    end
  end
end
