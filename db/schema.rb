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

ActiveRecord::Schema.define(version: 20150713093931) do

  create_table "beds", force: :cascade do |t|
    t.integer  "room_id"
    t.string   "bed_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "beds", ["room_id", "bed_number"], name: "index_beds_on_room_id_and_bed_number", using: :btree

  create_table "hospitals", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "hospitals", ["name"], name: "index_hospitals_on_name", using: :btree

  create_table "patient_categories", force: :cascade do |t|
    t.integer  "hospital_id"
    t.string   "name"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "patient_categories", ["hospital_id", "name"], name: "index_patient_categories_on_hospital_id_and_name", using: :btree

  create_table "patients", force: :cascade do |t|
    t.integer  "patient_category_id"
    t.string   "first_name"
    t.string   "surname"
    t.datetime "date_of_birth"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "patients", ["date_of_birth"], name: "index_patients_on_date_of_birth", using: :btree
  add_index "patients", ["first_name", "surname"], name: "index_patients_on_first_name_and_surname", using: :btree
  add_index "patients", ["patient_category_id"], name: "index_patients_on_patient_category_id", using: :btree

  create_table "rooms", force: :cascade do |t|
    t.integer  "ward_id"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rooms", ["ward_id", "name"], name: "index_rooms_on_ward_id_and_name", using: :btree

  create_table "wards", force: :cascade do |t|
    t.integer  "hospital_id"
    t.integer  "patient_category_id"
    t.string   "name"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "wards", ["hospital_id", "name"], name: "index_wards_on_hospital_id_and_name", using: :btree
  add_index "wards", ["patient_category_id", "name"], name: "index_wards_on_patient_category_id_and_name", using: :btree

end
