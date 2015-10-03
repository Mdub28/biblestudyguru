module Api
  module V1
    class BaseApiController < ApplicationController
      before_filter :parse_request, :authenticate_user_from_token!
    
      private
      def authenticate_user_from_token!
        #if !@json['api_token']
        #  render nothing: true, status: :unauthorized
        #else
        #  @user = nil
        #  User.find_each do |u|
        #    if Devise.secure_compare(u.api_token, @json['api_token'])
        #      @user = u
        #    end
        #  end
        #end
      end
    
      def parse_request
        @json = JSON.parse(request.body.read) unless request.body.present?
        @json ||= {}
      end

      def format_json_output(data, options = {})
        options = options.reverse_merge({
          status: 'success',
          message: nil
        })
        options[:data] = data
        options.to_json
      end
    end
  end
end
