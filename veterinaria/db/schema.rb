# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150724055449) do

  create_table "categories", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "citations", force: :cascade do |t|
    t.date     "date"
    t.time     "time"
    t.text     "observation", limit: 65535
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "clients", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "firstlastname",  limit: 255
    t.string   "secondlastname", limit: 255
    t.date     "birthday"
    t.string   "direction",      limit: 255
    t.string   "phone",          limit: 255
    t.string   "email",          limit: 255
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.integer  "province_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "districts", ["province_id"], name: "index_districts_on_province_id", using: :btree

  create_table "patients", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "color",      limit: 255
    t.date     "birthday"
    t.string   "sex",        limit: 255
    t.decimal  "weight",                 precision: 10
    t.integer  "client_id",  limit: 4
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  add_index "patients", ["client_id"], name: "index_patients_on_client_id", using: :btree

  create_table "product_categories", force: :cascade do |t|
    t.string   "name",        limit: 60
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "products", force: :cascade do |t|
    t.string   "name",                limit: 100
    t.decimal  "cost_price",                        precision: 10
    t.decimal  "sale_price",                        precision: 10
    t.string   "long_description",    limit: 200
    t.text     "observation",         limit: 65535
    t.integer  "product_category_id", limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
  end

  add_index "products", ["product_category_id"], name: "index_products_on_product_category_id", using: :btree

  create_table "provinces", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "department_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "provinces", ["department_id"], name: "index_provinces_on_department_id", using: :btree

  create_table "races", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "category_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "races", ["category_id"], name: "index_races_on_category_id", using: :btree

  create_table "services", force: :cascade do |t|
    t.string   "name",        limit: 60
    t.decimal  "price",                     precision: 10
    t.text     "observation", limit: 65535
    t.integer  "citation_id", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "services", ["citation_id"], name: "index_services_on_citation_id", using: :btree

  create_table "unit_measures", force: :cascade do |t|
    t.string   "short_name",  limit: 5
    t.string   "name",        limit: 30
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_foreign_key "districts", "provinces"
  add_foreign_key "patients", "clients"
  add_foreign_key "products", "product_categories"
  add_foreign_key "provinces", "departments"
  add_foreign_key "races", "categories"
  add_foreign_key "services", "citations"
end
