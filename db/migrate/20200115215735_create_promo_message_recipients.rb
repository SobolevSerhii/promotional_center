class CreatePromoMessageRecipients < ActiveRecord::Migration[6.0]
  def change
    create_table :promo_message_recipients do |t|
      t.string :recipient_phone, index: true
      t.references :ad, null: false, foreign_key: true
      t.references :promo_message, null: false, foreign_key: true
      t.references :recipient, references: :users, null: false,
                               foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
