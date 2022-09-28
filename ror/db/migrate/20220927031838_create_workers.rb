class CreateWorkers < ActiveRecord::Migration[7.0]
  def change
    create_table :workers, id: :uuid do |t|
      t.string :name, null: false
      t.string :last_name, null: false
      t.string :email, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
