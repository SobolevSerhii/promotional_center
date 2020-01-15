class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :title, null: false, index: true
      t.text :description, null: false, default: ''
      t.integer :status, null: false, default: 0, index: true
      t.references :publisher, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
