# frozen_string_literal: true

module Api
  module V1
    # Department's creation
    class SpreadsheetsController < ApplicationController
      before_action :check_login, only: %i[create]

      def create

        sheet = Roo::Spreadsheet.open(params[:spread_sheet])
        clean_sheet = SpreadSheetService.new(sheet, current_user_org)
        clean_sheet.save_departments
        clean_sheet.save_workers
        clean_sheet.save_working_hrs

        # render json: {
        #   workers: clean_sheet.sheet
        # }

      end



    end
  end
end
