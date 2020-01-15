class CreatePromoMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :promo_messages do |t|
      t.text :body, null: false
      t.string :title, null: false, index: true
      t.integer :status, null: false, default: 0, index: true
      t.references :creator, references: :users, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
