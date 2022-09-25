class CreateDepartmentConfigurations < ActiveRecord::Migration[7.0]
  def change
    create_table :department_configurations, id: :uuid do |t|
      t.integer :weekly_hrs, default: 8
      t.integer :daily_hrs, default: 48
      t.references :department, null: false, foreign_key: true, type: :uuid
      t.references :organization, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
