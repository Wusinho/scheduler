# frozen_string_literal: true

module Api
  module V1
    # Department's creation
    class SpreadsheetsController < ApplicationController
      before_action :check_login, only: %i[create]

      def create

        p params
      end



    end
  end
end
