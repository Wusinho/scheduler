class CreateWorkerAvailableHrs < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_available_hrs, id: :uuid do |t|
      t.string :monday, array: true, null: false
      t.string :tuesday, array: true, null: false
      t.string :wednesday, array: true, null: false
      t.string :thursday, array: true, null: false
      t.string :friday, array: true, null: false
      t.string :saturday, array: true, null: false
      t.string :sunday, array: true, null: false

      t.references :worker, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
