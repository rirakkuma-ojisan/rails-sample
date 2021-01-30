class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :password_digest, null: false

      t.timestamps
    end
    # nameにunique key 制約をつける
    add_index :users, :name, unique: true
  end
end
