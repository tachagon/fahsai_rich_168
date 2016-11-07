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

ActiveRecord::Schema.define(version: 20161107113736) do

  create_table "amphurs", force: :cascade do |t|
    t.string   "name"
    t.integer  "province_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["name", "province_id"], name: "index_amphurs_on_name_and_province_id", unique: true
    t.index ["name"], name: "index_amphurs_on_name"
    t.index ["province_id"], name: "index_amphurs_on_province_id"
  end

  create_table "district_zipcodes", force: :cascade do |t|
    t.integer  "district_id"
    t.integer  "zipcode_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["district_id", "zipcode_id"], name: "index_district_zipcodes_on_district_id_and_zipcode_id", unique: true
    t.index ["district_id"], name: "index_district_zipcodes_on_district_id"
    t.index ["zipcode_id"], name: "index_district_zipcodes_on_zipcode_id"
  end

  create_table "districts", force: :cascade do |t|
    t.string   "name"
    t.integer  "amphur_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["amphur_id"], name: "index_districts_on_amphur_id"
    t.index ["name", "amphur_id"], name: "index_districts_on_name_and_amphur_id", unique: true
    t.index ["name"], name: "index_districts_on_name"
  end

  create_table "provinces", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_provinces_on_name", unique: true
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "level"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "zipcodes", force: :cascade do |t|
    t.string   "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_zipcodes_on_code", unique: true
  end

end
