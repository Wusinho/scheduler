# frozen_string_literal: true

# spreadsheet_helper
module HelperableConcern
  extend ActiveSupport::Concern

  def create_template(keys)
    Hash[keys.map { |x| [x, ''] }]
  end

  def create_workers(workers, template)
    workers_to_save = []
    workers.each do |worker|
      temp_arr = template.to_a
      worker.map.with_index { |value, i| temp_arr[i][1] = value }
      workers_to_save << temp_arr.to_h
    end
    workers_to_save
  end

  # removes white rows that are nil and reject if any value is empty
  def clean_sheet(spread_sheet)
    remove_header(spread_sheet.map(&:compact).reject(&:blank?))
  end

  # removes the header
  def remove_header(spread_sheet)
    spread_sheet.reject { |worker| worker.to_a.flatten.uniq.length == 11 }
  end


end
