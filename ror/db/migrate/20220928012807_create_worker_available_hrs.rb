class CreateWorkerAvailableHrs < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_available_hrs, id: :uuid do |t|
      t.string :monday
      t.string :tuesday
      t.string :wednesday
      t.string :thursday
      t.string :friday
      t.references :subject, null: false, foreign_key: true, type: :uuid
      t.references :worker, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
