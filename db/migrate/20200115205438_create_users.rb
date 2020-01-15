class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :phone
      t.string :device_id
      t.string :email, null: false, index: { unique: true }
      t.string :encrypted_password, limit: 128, null: false

      t.string :confirmation_token, limit: 128
      t.string :remember_token, limit: 128, null: false, index: true

      t.timestamps
    end
    add_index :users, :phone, where: 'phone is NOT NULL'
    add_index :users, :device_id, where: 'device_uid IS NOT NULL'
  end
end
