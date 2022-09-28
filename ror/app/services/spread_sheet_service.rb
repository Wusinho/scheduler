class SpreadSheetService
  include HelperableConcern
  attr_reader :spread_sym

  def initialize(spreadsheet)
    @spreadsheet = clean_sheet(spreadsheet.parse(headers: true))
    @spread_sym =  @spreadsheet.map(&:symbolize_keys)
  end

  def save_workers

  end



end
