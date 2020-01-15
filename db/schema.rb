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

ActiveRecord::Schema.define(version: 2020_01_14_223431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.string "name"
    t.text "biography"
    t.text "intentions"
    t.string "website"
    t.text "contact"
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

  create_table "data_types", force: :cascade do |t|
    t.string "name"
    t.bigint "datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["datum_id"], name: "index_data_types_on_datum_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.text "information_usage"
    t.text "requirements"
    t.text "reward"
    t.boolean "anonymous"
    t.integer "total"
    t.string "types"
    t.boolean "accept?"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.bigint "datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "hidden"
    t.string "format"
    t.index ["buyer_id"], name: "index_inquiries_on_buyer_id"
    t.index ["datum_id"], name: "index_inquiries_on_datum_id"
    t.index ["seller_id"], name: "index_inquiries_on_seller_id"
  end

  create_table "orders", force: :cascade do |t|
    t.integer "deposit"
    t.integer "amount"
    t.string "status"
    t.bigint "buyer_id"
    t.bigint "trade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_orders_on_buyer_id"
    t.index ["trade_id"], name: "index_orders_on_trade_id"
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
    t.index ["user_id"], name: "index_sellers_on_user_id"
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

  create_table "votes", id: :serial, force: :cascade do |t|
    t.string "votable_type"
    t.integer "votable_id"
    t.string "voter_type"
    t.integer "voter_id"
    t.boolean "vote_flag"
    t.string "vote_scope"
    t.integer "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope"
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope"
  end

  add_foreign_key "buyers", "users"
  add_foreign_key "data", "sellers"
  add_foreign_key "data_types", "data"
  add_foreign_key "inquiries", "buyers"
  add_foreign_key "inquiries", "data"
  add_foreign_key "inquiries", "sellers"
  add_foreign_key "orders", "buyers"
  add_foreign_key "orders", "trades"
  add_foreign_key "reviews", "buyers"
  add_foreign_key "reviews", "trades"
  add_foreign_key "sellers", "users"
  add_foreign_key "trades", "data"
  add_foreign_key "trades", "inquiries"
end
