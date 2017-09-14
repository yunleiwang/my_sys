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

ActiveRecord::Schema.define(version: 20170914165620) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "crf_infos", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "seq"
    t.integer  "crf_type"
    t.integer  "follow"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "item_form_metaelements", force: :cascade do |t|
    t.string   "no"
    t.string   "parentno"
    t.integer  "item_id"
    t.integer  "crf_info_id"
    t.integer  "section_id"
    t.string   "header"
    t.string   "subheader"
    t.integer  "parent_id"
    t.integer  "ordinal"
    t.boolean  "required"
    t.boolean  "show_item"
    t.string   "trigger"
    t.string   "options_index"
    t.integer  "item_group_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "item_group_metaelements", force: :cascade do |t|
    t.string   "no"
    t.string   "parentno"
    t.integer  "item_group_id"
    t.integer  "crf_info_id"
    t.string   "header"
    t.string   "subheader"
    t.integer  "repeat_number"
    t.integer  "repeat_max"
    t.integer  "item_id"
    t.integer  "seq"
    t.boolean  "show_group"
    t.boolean  "repeating_group"
    t.string   "options_index"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "parent_id"
  end

  create_table "item_groups", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "item_value_orders", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "patient_visit_id"
    t.float    "complete"
    t.integer  "ordinal"
    t.integer  "user_id"
    t.integer  "history"
    t.integer  "status"
    t.integer  "crf_info_id"
    t.integer  "menus_crf_info_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  create_table "item_values", force: :cascade do |t|
    t.integer  "item_id"
    t.text     "value"
    t.integer  "patient_id"
    t.integer  "menus_crf_info_id"
    t.integer  "patient_visit_id"
    t.integer  "item_value_order_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "item_group_id"
    t.integer  "item_group_ordinal"
  end

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.string   "units"
    t.string   "header"
    t.string   "left_item_text"
    t.string   "right_item_text"
    t.boolean  "phi_status"
    t.string   "item_data_type"
    t.string   "response_type"
    t.string   "options_text"
    t.string   "options_value"
    t.string   "default_value"
    t.string   "regexp"
    t.string   "regexp_error_msg"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "menus", force: :cascade do |t|
    t.string   "name_cn"
    t.string   "name_en"
    t.integer  "menu_id"
    t.string   "link"
    t.integer  "seq"
    t.string   "icon_class"
    t.string   "belong_to"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "menu_type"
    t.integer  "hidden"
  end

  create_table "menus_crf_infos", force: :cascade do |t|
    t.integer  "menu_id"
    t.integer  "crf_info_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "seq"
  end

  create_table "observes", force: :cascade do |t|
    t.date     "observe_date"
    t.integer  "patient_id"
    t.integer  "patient_visit_id"
    t.integer  "observe_hour"
    t.string   "drug"
    t.integer  "attack"
    t.string   "cause"
    t.string   "sleep_info"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.integer  "observe_minute"
    t.string   "other_drug"
    t.integer  "has_before_cause"
    t.string   "attack_show"
    t.string   "duration"
    t.integer  "duration_time"
    t.string   "environment_change"
  end

  create_table "patient_visits", force: :cascade do |t|
    t.integer  "patient_id"
    t.date     "visiting_time"
    t.string   "telephone"
    t.string   "home_address"
    t.string   "degree_of_education"
    t.string   "occupation"
    t.string   "responsible_doctor"
    t.string   "person_filing"
    t.date     "created_date"
    t.string   "created_unit"
    t.string   "marital_status"
    t.string   "contact_name"
    t.string   "contact_relationship"
    t.string   "contact_address"
    t.string   "contact_phone"
    t.string   "visit_type"
    t.string   "patient_source"
    t.string   "admission_number"
    t.date     "admission_date"
    t.date     "discharge_date"
    t.string   "outpatient_number"
    t.string   "diagnostic_types"
    t.string   "diagnostic_degree"
    t.string   "diagnostic_anoxia"
    t.string   "other_diseases"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string   "file_number"
    t.string   "id_number"
    t.string   "name"
    t.string   "gender"
    t.date     "birthday"
    t.string   "nation"
    t.string   "native_place"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "file_type"
    t.string   "birth_place"
    t.date     "first_admission_date"
    t.string   "family_name"
    t.string   "contact_phone"
  end

  create_table "public_libs", force: :cascade do |t|
    t.string   "table_name"
    t.string   "item_name"
    t.string   "item_text"
    t.string   "item_value"
    t.string   "pinyin"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "search_libs", force: :cascade do |t|
    t.string   "field_name",             limit: 255
    t.string   "host_table",             limit: 255
    t.string   "correspond_field",       limit: 255
    t.string   "correspond_field_value", limit: 255
    t.string   "note",                   limit: 255
    t.string   "patient_info_name",      limit: 255
    t.string   "attached_field",         limit: 255
    t.string   "attached_value",         limit: 255
    t.string   "ha",                     limit: 255
    t.string   "ha_value",               limit: 255
    t.string   "parent_table",           limit: 255
    t.string   "parent_field",           limit: 255
    t.string   "parent_release",         limit: 255
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.boolean  "is_lib_public"
  end

  create_table "sections", force: :cascade do |t|
    t.string   "name"
    t.string   "title"
    t.string   "subtitle"
    t.integer  "seq"
    t.integer  "parent_id"
    t.integer  "crf_info_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "sys_exports", force: :cascade do |t|
    t.string   "field_zh_name", limit: 255
    t.string   "field_en_name", limit: 255
    t.string   "table_name",    limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.integer  "crf_table_id"
    t.integer  "item_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "username"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
