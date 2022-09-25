# frozen_string_literal: true

module Api
  module V1
    # user's session
    class SessionsController < ApplicationController
      def create
        @user = User.find_by_email(user_params[:email])
        if @user&.authenticate(user_params[:password])
          @user.add_sign_in_counter
          render json: {
            token: JsonWebToken.encode(user_id: @user.id),
            email: @user.email,
          }
        else
          head :unauthorized
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end
