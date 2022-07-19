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

ActiveRecord::Schema.define(version: 2022_07_19_104426) do

  create_table "companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "contacts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "title"
    t.string "first_name"
    t.string "last_name"
    t.string "number"
    t.string "street_address1"
    t.string "street_address2"
    t.string "town"
    t.string "post_code_string"
    t.string "email"
    t.string "phone_number"
    t.string "head_office"
    t.string "buyer"
    t.string "invoice"
    t.bigint "site_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_contacts_on_company_id"
    t.index ["site_id"], name: "index_contacts_on_site_id"
  end

  create_table "orders", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id"
    t.bigint "site_id"
    t.boolean "is_recurring", default: false
    t.string "repeat_interval"
    t.datetime "delievery_date"
    t.datetime "recurring_end_date"
    t.index ["site_id"], name: "index_orders_on_site_id"
    t.index ["user_id"], name: "index_orders_on_user_id"
  end

  create_table "product_order_details", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.bigint "order_id", null: false
    t.string "quantity"
    t.string "special_instructions"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["order_id"], name: "index_product_order_details_on_order_id"
    t.index ["product_id"], name: "index_product_order_details_on_product_id"
  end

  create_table "products", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "size"
    t.string "packaging"
    t.text "description"
    t.string "price"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "sites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "street_address_one"
    t.string "street_address_two"
    t.string "town"
    t.string "post_code"
    t.string "head_office"
    t.string "invoice_address"
    t.string "contact"
    t.string "invoice_email"
    t.string "phone_number"
    t.string "payment_method"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "company_id"
    t.index ["company_id"], name: "index_sites_on_company_id"
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "role", default: 0
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "contacts", "companies"
  add_foreign_key "contacts", "sites"
  add_foreign_key "orders", "sites"
  add_foreign_key "orders", "users"
  add_foreign_key "product_order_details", "orders"
  add_foreign_key "product_order_details", "products"
  add_foreign_key "sites", "companies"
end
