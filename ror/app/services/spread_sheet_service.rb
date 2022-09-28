class SpreadSheetService
  include HelperableConcern

  def initialize(spreadsheet)
    @spreadsheet = clean_sheet(spreadsheet.parse(headers: true))
  end

  def sheet
    @spreadsheet
  end


end
