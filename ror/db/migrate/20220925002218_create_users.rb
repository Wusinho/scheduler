class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.string :email, null: false, index: { unique: true }
      t.string :last_name, null: false
      t.string :username, null: false
      t.string :password_digest
      t.integer :sign_in_count, default: 0
      t.integer :subscription, default: 0

      t.timestamps
    end
  end
end
