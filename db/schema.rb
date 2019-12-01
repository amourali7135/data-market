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

ActiveRecord::Schema.define(version: 2019_12_01_194157) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "buyers", force: :cascade do |t|
    t.text "biography"
    t.text "intentions"
    t.string "website"
    t.text "contact"
    t.integer "size"
    t.string "photo"
    t.string "country"
    t.string "city"
    t.string "phone"
    t.string "email"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_buyers_on_user_id"
  end

  create_table "data", force: :cascade do |t|
    t.string "format"
    t.text "content"
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
    t.text "information"
    t.text "requirements"
    t.text "usage"
    t.text "reward"
    t.boolean "anonymous"
    t.bigint "buyer_id"
    t.bigint "seller_id"
    t.bigint "datum_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_inquiries_on_buyer_id"
    t.index ["datum_id"], name: "index_inquiries_on_datum_id"
    t.index ["seller_id"], name: "index_inquiries_on_seller_id"
  end

  create_table "payments", force: :cascade do |t|
    t.integer "deposit"
    t.integer "amount"
    t.bigint "buyer_id"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_payments_on_buyer_id"
    t.index ["transaction_id"], name: "index_payments_on_transaction_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "writeup"
    t.integer "rating"
    t.bigint "buyer_id"
    t.bigint "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buyer_id"], name: "index_reviews_on_buyer_id"
    t.index ["transaction_id"], name: "index_reviews_on_transaction_id"
  end

  create_table "sellers", force: :cascade do |t|
    t.integer "age"
    t.string "country"
    t.string "sex"
    t.string "occupation"
    t.string "city"
    t.integer "income"
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
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sellers_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.date "date"
    t.integer "price"
    t.bigint "datum_id"
    t.bigint "inquiry_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["datum_id"], name: "index_transactions_on_datum_id"
    t.index ["inquiry_id"], name: "index_transactions_on_inquiry_id"
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
  add_foreign_key "data_types", "data"
  add_foreign_key "inquiries", "buyers"
  add_foreign_key "inquiries", "data"
  add_foreign_key "inquiries", "sellers"
  add_foreign_key "payments", "buyers"
  add_foreign_key "payments", "transactions"
  add_foreign_key "reviews", "buyers"
  add_foreign_key "reviews", "transactions"
  add_foreign_key "sellers", "users"
  add_foreign_key "transactions", "data"
  add_foreign_key "transactions", "inquiries"
end
