class CreateWorkerDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :worker_departments, id: :uuid do |t|
      t.references :department, null: false, foreign_key: true, type: :uuid
      t.references :worker, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
