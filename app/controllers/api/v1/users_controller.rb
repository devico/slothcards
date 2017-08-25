module Api
  module V1
    class UsersController < ApplicationController

      def create
        user = User.create!(user_params)
        token = Jwt::TokenProvider.(user_id: user.id)
        response = {user: user, token: token}
        json_response(response, :created)
      end

      private

      def user_params
        params.permit(
          :email,
          :password,
          :password_confirmation
        )
      end      
    end
  end
end
