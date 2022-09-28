# frozen_string_literal: true

module Api
  module V1
    # Department's creation
    class SpreadsheetsController < ApplicationController
      before_action :check_login, only: %i[create]

      def create
        sheet = Roo::Spreadsheet.open(params[:spread_sheet])
        clean_sheet = SpreadSheetService.new(sheet)
        p clean_sheet.spread_sym
        # render json: {
        #   workers: clean_sheet.sheet
        # }

      end



    end
  end
end
