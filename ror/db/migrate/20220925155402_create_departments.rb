class CreateDepartments < ActiveRecord::Migration[7.0]
  def change
    create_table :departments, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :supervised_hrs, array: true, default: []
      t.references :organization, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
