# frozen_string_literal: true

module Api
  module V1
    # User's registration
    class RegistrationsController < ApplicationController

      def create
        @user = User.new(user_params)
        if @user.save
          @user.increment(:sign_in_count)
          render json: @user, status: :created
        else
          render json: @user.errors, status: :unprocessable_entity
        end
      end

      private

      def user_params
        params.require(:user).permit(:name, :last_name, :username, :password, :email)
      end

    end
  end
end
