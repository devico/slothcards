module Api
  module V1
    class SessionsController < ApplicationController
      
      def create
        auth_token =
          Jwt::UserAuthenticator.call(auth_params[:email], auth_params[:password])
        json_response(auth_token: auth_token)
      end

      private

      def auth_params
        params.permit(:email, :password)
      end      
    end
  end
end
