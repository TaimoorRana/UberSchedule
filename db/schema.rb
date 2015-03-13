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

ActiveRecord::Schema.define(version: 20150313194413) do

  create_table "courses", primary_key: "course_id", force: :cascade do |t|
    t.string  "course_type",        limit: 4,          null: false
    t.integer "course_nb",          limit: 4,          null: false
    t.float   "course_credit",      limit: 53,         null: false
    t.string  "course_name",        limit: 128,        null: false
    t.text    "course_description", limit: 4294967295
  end

  create_table "days_of_weeks", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "Day",        limit: 255
  end

  create_table "major_options", force: :cascade do |t|
    t.string   "option",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "periods", force: :cascade do |t|
    t.string   "day",        limit: 255
    t.string   "timeSlot",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.boolean  "loyola",     limit: 1
    t.boolean  "split",      limit: 1
    t.string   "option",     limit: 255
    t.string   "status",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "prereq_types", primary_key: "prereq_type_id", force: :cascade do |t|
    t.string "prereq_type_lib", limit: 128, null: false
  end

  create_table "schedules", primary_key: "schedule_id", force: :cascade do |t|
    t.string "schedule_lib", limit: 128
  end

  create_table "sequences", primary_key: "sequence_id", force: :cascade do |t|
    t.string "sequence_name", limit: 128, null: false
  end

  create_table "student_statuses", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", primary_key: "student_id", force: :cascade do |t|
    t.string  "student_firstname", limit: 64,  null: false
    t.string  "student_lastname",  limit: 64,  null: false
    t.integer "user_id",           limit: 4
    t.integer "sequence_id",       limit: 4
    t.string  "option",            limit: 255
  end

  add_index "students", ["sequence_id"], name: "sequence_id", using: :btree
  add_index "students", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "tbl_course_lab", primary_key: "course_lab_id", force: :cascade do |t|
    t.string  "course_lab_name",    limit: 2
    t.string  "course_lab_date_",   limit: 128
    t.integer "course_tutorial_id", limit: 4
  end

  add_index "tbl_course_lab", ["course_tutorial_id"], name: "course_tutorial_id", using: :btree

  create_table "tbl_course_section", primary_key: "course_section_id", force: :cascade do |t|
    t.string  "course_section_name",  limit: 2
    t.string  "course_section_date_", limit: 128
    t.integer "course_id",            limit: 4
  end

  add_index "tbl_course_section", ["course_id"], name: "course_id", using: :btree

  create_table "tbl_course_tutorial", primary_key: "course_tutorial_id", force: :cascade do |t|
    t.string  "course_tutorial_name",  limit: 2
    t.string  "course_tutorial_date_", limit: 128
    t.integer "course_section_id",     limit: 4
  end

  add_index "tbl_course_tutorial", ["course_section_id"], name: "course_section_id", using: :btree

  create_table "tbl_lookup_course_completed", id: false, force: :cascade do |t|
    t.integer "student_id", limit: 4, null: false
    t.integer "course_id",  limit: 4, null: false
  end

  add_index "tbl_lookup_course_completed", ["course_id"], name: "tbl_lookup_course_completed_ibfk_2", using: :btree
  add_index "tbl_lookup_course_completed", ["student_id"], name: "tbl_lookup_course_completed_ibfk_1", using: :btree

  create_table "tbl_lookup_course_prerequisites", id: false, force: :cascade do |t|
    t.integer "course_id",        limit: 4, null: false
    t.integer "course_id_prereq", limit: 4, null: false
    t.integer "prereq_type_id",   limit: 4, null: false
  end

  add_index "tbl_lookup_course_prerequisites", ["course_id"], name: "tbl_lookup_course_prerequisites_ibfk_1", using: :btree
  add_index "tbl_lookup_course_prerequisites", ["course_id_prereq"], name: "tbl_lookup_course_prerequisites_ibfk_2", using: :btree
  add_index "tbl_lookup_course_prerequisites", ["prereq_type_id"], name: "tbl_lookup_course_prerequisites_ibfk_3_idx", using: :btree

  create_table "tbl_lookup_course_registered", id: false, force: :cascade do |t|
    t.integer "course_id",   limit: 4, null: false
    t.integer "schedule_id", limit: 4, null: false
    t.integer "student_id",  limit: 4, null: false
  end

  add_index "tbl_lookup_course_registered", ["course_id"], name: "course_id", using: :btree
  add_index "tbl_lookup_course_registered", ["schedule_id"], name: "schedule_id", using: :btree
  add_index "tbl_lookup_course_registered", ["student_id"], name: "student_id", using: :btree

  create_table "tbl_lookup_sequence_course", id: false, force: :cascade do |t|
    t.integer "sequence_id", limit: 4
    t.integer "course_id",   limit: 4
  end

  add_index "tbl_lookup_sequence_course", ["course_id"], name: "course_id", using: :btree
  add_index "tbl_lookup_sequence_course", ["sequence_id"], name: "sequence_id", using: :btree

  create_table "tbl_preference", primary_key: "preference_id", force: :cascade do |t|
    t.string "preference_lib", limit: 128
  end

  add_index "tbl_preference", ["preference_id"], name: "preference_id", unique: true, using: :btree

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "user_name",     limit: 64,  null: false
    t.string   "user_pass",     limit: 64,  null: false
    t.string   "user_email",    limit: 128
    t.datetime "user_reg_date",             null: false
  end

  add_foreign_key "students", "sequences", primary_key: "sequence_id", name: "students_ibfk_2"
  add_foreign_key "students", "users", primary_key: "user_id", name: "students_ibfk_1"
  add_foreign_key "tbl_course_lab", "tbl_course_tutorial", column: "course_tutorial_id", primary_key: "course_tutorial_id", name: "tbl_course_lab_ibfk_1"
  add_foreign_key "tbl_course_section", "courses", primary_key: "course_id", name: "tbl_course_section_ibfk_1"
  add_foreign_key "tbl_course_tutorial", "tbl_course_section", column: "course_section_id", primary_key: "course_section_id", name: "tbl_course_tutorial_ibfk_1"
  add_foreign_key "tbl_lookup_course_completed", "courses", primary_key: "course_id", name: "tbl_lookup_course_completed_ibfk_2"
  add_foreign_key "tbl_lookup_course_completed", "students", primary_key: "student_id", name: "tbl_lookup_course_completed_ibfk_1"
  add_foreign_key "tbl_lookup_course_prerequisites", "courses", column: "course_id_prereq", primary_key: "course_id", name: "tbl_lookup_course_prerequisites_ibfk_2"
  add_foreign_key "tbl_lookup_course_prerequisites", "courses", primary_key: "course_id", name: "tbl_lookup_course_prerequisites_ibfk_1"
  add_foreign_key "tbl_lookup_course_prerequisites", "prereq_types", primary_key: "prereq_type_id", name: "tbl_lookup_course_prerequisites_ibfk_3"
  add_foreign_key "tbl_lookup_course_registered", "courses", primary_key: "course_id", name: "tbl_lookup_course_registered_ibfk_1"
  add_foreign_key "tbl_lookup_course_registered", "schedules", primary_key: "schedule_id", name: "tbl_lookup_course_registered_ibfk_2"
  add_foreign_key "tbl_lookup_course_registered", "students", primary_key: "student_id", name: "tbl_lookup_course_registered_ibfk_3"
  add_foreign_key "tbl_lookup_sequence_course", "courses", primary_key: "course_id", name: "tbl_lookup_sequence_course_ibfk_2"
  add_foreign_key "tbl_lookup_sequence_course", "sequences", primary_key: "sequence_id", name: "tbl_lookup_sequence_course_ibfk_1"
end
