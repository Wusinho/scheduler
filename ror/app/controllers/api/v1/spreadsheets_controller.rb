# frozen_string_literal: true

module Api
  module V1
    # Department's creation
    class SpreadsheetsController < ApplicationController
      include HelperableConcern

      before_action :check_login, only: %i[create]

      def create
        p '*'*100
        sheet = Roo::Spreadsheet.open(params[:spread_sheet])
        workers = clean_sheet(sheet.parse(headers: true))
        workers.each { |wor|p wor}
        p '*'*100

      end



    end
  end
end
