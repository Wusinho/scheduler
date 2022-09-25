# frozen_string_literal: true

module Api
  module V1
    # user's session
    class SessionsController < ApplicationController
      def create
        @user = User.find_by_email(user_params[:email])
        if @user&.authenticate(user_params[:password])
          @user.increment!(:sign_in_count)
          render json: {
            token: JsonWebToken.encode(user_id: @user.id),
            email: @user.email
          }, status: :created
        else
          render json: {
            error: 'Wrong email/password'
          }, status: :not_found
        end
      end

      private

      def user_params
        params.require(:user).permit(:email, :password)
      end

    end
  end
end
