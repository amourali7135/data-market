# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_15_100559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.text "intentions"
    t.string "website"
    t.integer "size"
    t.string "photo"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "types"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buyers_on_user_id"
  end

  create_table "conversations", force: :cascade do |t|
    t.bigint "author_id"
    t.bigint "receiver_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_conversations_on_author_id"
    t.index ["receiver_id"], name: "index_conversations_on_receiver_id"
  end

  create_table "data", force: :cascade do |t|
    t.string "format"
    t.text "content"
    t.string "types"
    t.bigint "seller_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "payment_id"
    t.index ["payment_id"], name: "index_data_on_payment_id"
    t.index ["seller_id"], name: "index_data_on_seller_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.text "information_usage"
    t.text "requirements"
    t.text "reward"
    t.boolean "anonymous"
    t.integer "total"
    t.string "types"
    t.bigint "buyer_id"
    t.bigint "datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden"
    t.string "format"
    t.string "title"
    t.text "instructions"
    t.datetime "active"
    t.integer "price_cents", default: 0, null: false
    t.string "sku"
    t.index ["buyer_id"], name: "index_inquiries_on_buyer_id"
    t.index ["datum_id"], name: "index_inquiries_on_datum_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.boolean "read"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.bigint "conversation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_messages_on_buyer_id"
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["seller_id"], name: "index_messages_on_seller_id"
  end

  create_table "orders", force: :cascade do |t|
    t.string "state"
    t.string "inquiry_sku"
    t.integer "amount_cents", default: 0, null: false
    t.string "checkout_session_id"
    t.bigint "user_id"
    t.bigint "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_orders_on_inquiry_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "punches", id: :serial, force: :cascade do |t|
    t.integer "punchable_id", null: false
    t.string "punchable_type", limit: 20, null: false
    t.datetime "starts_at", null: false
    t.datetime "ends_at", null: false
    t.datetime "average_time", null: false
    t.integer "hits", default: 1, null: false
    t.index ["average_time"], name: "index_punches_on_average_time"
    t.index ["punchable_type", "punchable_id"], name: "punchable_index"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "writeup"
    t.integer "rating"
    t.bigint "buyer_id"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
    t.index ["trade_id"], name: "index_reviews_on_trade_id"
  end

  create_table "sellerinquiries", force: :cascade do |t|
    t.datetime "completed"
    t.bigint "seller_id"
    t.bigint "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["inquiry_id"], name: "index_sellerinquiries_on_inquiry_id"
    t.index ["seller_id"], name: "index_sellerinquiries_on_seller_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "age"
    t.string "country"
    t.string "sex"
    t.string "occupation"
    t.string "city"
    t.string "income"
    t.string "ethnicity"
    t.string "race"
    t.string "religion"
    t.string "sexuality"
    t.string "politics"
    t.string "relationship_status"
    t.boolean "children"
    t.boolean "verified"
    t.string "birth_country"
    t.boolean "smoker"
    t.string "education_level"
    t.string "types"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_sellers_on_user_id"
  end

  create_table "taggings", id: :serial, force: :cascade do |t|
    t.integer "tag_id"
    t.string "taggable_type"
    t.integer "taggable_id"
    t.string "tagger_type"
    t.integer "tagger_id"
    t.string "context", limit: 128
    t.datetime "created_at"
    t.index ["context"], name: "index_taggings_on_context"
    t.index ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true
    t.index ["tag_id"], name: "index_taggings_on_tag_id"
    t.index ["taggable_id", "taggable_type", "context"], name: "index_taggings_on_taggable_id_and_taggable_type_and_context"
    t.index ["taggable_id", "taggable_type", "tagger_id", "context"], name: "taggings_idy"
    t.index ["taggable_id"], name: "index_taggings_on_taggable_id"
    t.index ["taggable_type"], name: "index_taggings_on_taggable_type"
    t.index ["tagger_id", "tagger_type"], name: "index_taggings_on_tagger_id_and_tagger_type"
    t.index ["tagger_id"], name: "index_taggings_on_tagger_id"
  end

  create_table "tags", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "taggings_count", default: 0
    t.index ["name"], name: "index_tags_on_name", unique: true
  end

  create_table "test_models", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trades", force: :cascade do |t|
    t.date "date"
    t.integer "price"
    t.bigint "datum_id"
    t.bigint "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["datum_id"], name: "index_trades_on_datum_id"
    t.index ["inquiry_id"], name: "index_trades_on_inquiry_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "buyers", "users"
  add_foreign_key "data", "sellers"
  add_foreign_key "inquiries", "buyers"
  add_foreign_key "inquiries", "data"
  add_foreign_key "orders", "inquiries"
  add_foreign_key "orders", "users"
  add_foreign_key "reviews", "buyers"
  add_foreign_key "reviews", "trades"
  add_foreign_key "sellerinquiries", "inquiries"
  add_foreign_key "sellerinquiries", "sellers"
  add_foreign_key "sellers", "users"
  add_foreign_key "trades", "data"
  add_foreign_key "trades", "inquiries"
end
