# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_03_23_131813) do
  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 50
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "clients", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "firstname", limit: 60
    t.string "lastname", limit: 60
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "comments", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.text "body"
    t.string "target_type"
    t.integer "target_id"
    t.index ["target_type", "target_id"], name: "index_comments_on_target_type_and_target_id"
  end

  create_table "companies", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "client_id"
  end

  create_table "individuals", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "client_id"
  end

  create_table "order_items", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "quantity"
    t.decimal "item_price", precision: 8, scale: 2
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "orders_id"
    t.bigint "products_id"
    t.index ["orders_id"], name: "index_order_items_on_orders_id"
    t.index ["products_id"], name: "index_order_items_on_products_id"
  end

  create_table "orders", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.datetime "created_at", precision: nil
    t.datetime "shipped_at", precision: nil
    t.string "status", limit: 20
    t.bigint "clients_id"
    t.index ["clients_id"], name: "index_orders_on_clients_id"
  end

  create_table "products", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.string "name", limit: 120
    t.decimal "price", precision: 8, scale: 2, null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "categories_id"
    t.index ["categories_id"], name: "index_products_on_categories_id"
  end

  create_table "suppliers", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|
    t.integer "product_id"
  end

  add_foreign_key "order_items", "orders", column: "orders_id"
  add_foreign_key "order_items", "products", column: "products_id"
  add_foreign_key "orders", "clients", column: "clients_id"
  add_foreign_key "products", "categories", column: "categories_id"
end
