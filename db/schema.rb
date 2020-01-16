# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_15_215735) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ads", force: :cascade do |t|
    t.string "title", null: false
    t.text "description", default: "", null: false
    t.integer "status", default: 0, null: false
    t.bigint "publisher_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["publisher_id"], name: "index_ads_on_publisher_id"
    t.index ["status"], name: "index_ads_on_status"
    t.index ["title"], name: "index_ads_on_title"
  end

  create_table "promo_message_recipients", force: :cascade do |t|
    t.string "recipient_phone"
    t.bigint "ad_id", null: false
    t.bigint "promo_message_id", null: false
    t.bigint "recipient_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["ad_id"], name: "index_promo_message_recipients_on_ad_id"
    t.index ["promo_message_id"], name: "index_promo_message_recipients_on_promo_message_id"
    t.index ["recipient_id"], name: "index_promo_message_recipients_on_recipient_id"
    t.index ["recipient_phone"], name: "index_promo_message_recipients_on_recipient_phone"
  end

  create_table "promo_messages", force: :cascade do |t|
    t.text "body", null: false
    t.string "title", null: false
    t.integer "status", default: 0, null: false
    t.bigint "creator_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["creator_id"], name: "index_promo_messages_on_creator_id"
    t.index ["status"], name: "index_promo_messages_on_status"
    t.index ["title"], name: "index_promo_messages_on_title"
  end

  create_table "users", force: :cascade do |t|
    t.string "phone"
    t.string "device_id"
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["device_id"], name: "index_users_on_device_id", where: "(device_id IS NOT NULL)"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["phone"], name: "index_users_on_phone", where: "(phone IS NOT NULL)"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "ads", "users", column: "publisher_id"
  add_foreign_key "promo_message_recipients", "ads"
  add_foreign_key "promo_message_recipients", "promo_messages"
  add_foreign_key "promo_message_recipients", "users", column: "recipient_id"
  add_foreign_key "promo_messages", "users", column: "creator_id"
end
