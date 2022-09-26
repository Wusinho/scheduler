# frozen_string_literal: true

module Api
  module V1
    # Department's creation
    class DepartmentsController < ApplicationController
      before_action :check_login, only: %i[create]

      def create

        @department = current_user_org.departments.build(department_params)

        if @department.save
          render json: @department, status: :created
        else
          render json: @department.errors, status: :unprocessable_entity
        end
      end

      private

      def department_params
        params.require(:department).permit(:name, :supervised_hrs => [])
      end
    end
  end
end
