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

ActiveRecord::Schema.define(version: 20150311231147) do

  create_table "students", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "option",     limit: 255
  end

  create_table "tbl_course", primary_key: "course_id", force: :cascade do |t|
    t.string  "course_type",        limit: 4,          null: false
    t.integer "course_nb",          limit: 4,          null: false
    t.float   "course_credit",      limit: 53,         null: false
    t.string  "course_name",        limit: 128,        null: false
    t.text    "course_description", limit: 4294967295
  end

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
    t.integer "student_id", limit: 4
    t.integer "course_id",  limit: 4
  end

  add_index "tbl_lookup_course_completed", ["course_id"], name: "course_id", using: :btree
  add_index "tbl_lookup_course_completed", ["student_id"], name: "student_id", using: :btree

  create_table "tbl_lookup_course_prerequisites", id: false, force: :cascade do |t|
    t.integer "course_id",        limit: 4
    t.integer "course_id_prereq", limit: 4
  end

  add_index "tbl_lookup_course_prerequisites", ["course_id"], name: "course_id", using: :btree
  add_index "tbl_lookup_course_prerequisites", ["course_id_prereq"], name: "course_id_prereq", using: :btree

  create_table "tbl_lookup_sequence_course", id: false, force: :cascade do |t|
    t.integer "sequence_id", limit: 4
    t.integer "course_id",   limit: 4
  end

  add_index "tbl_lookup_sequence_course", ["course_id"], name: "course_id", using: :btree
  add_index "tbl_lookup_sequence_course", ["sequence_id"], name: "sequence_id", using: :btree

  create_table "tbl_sequence", primary_key: "sequence_id", force: :cascade do |t|
    t.string "sequence_name", limit: 128, null: false
  end

  create_table "tbl_student", primary_key: "student_id", force: :cascade do |t|
    t.string  "student_firstname", limit: 64,  null: false
    t.string  "student_lastname",  limit: 64,  null: false
    t.integer "user_id",           limit: 4
    t.integer "sequence_id",       limit: 4
    t.string  "option",            limit: 255
  end

  add_index "tbl_student", ["sequence_id"], name: "sequence_id", using: :btree
  add_index "tbl_student", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "tbl_user", primary_key: "user_id", force: :cascade do |t|
    t.string   "user_name",     limit: 64,  null: false
    t.string   "user_pass",     limit: 64,  null: false
    t.string   "user_email",    limit: 128
    t.datetime "user_reg_date",             null: false
  end

  add_foreign_key "tbl_course_lab", "tbl_course_tutorial", column: "course_tutorial_id", primary_key: "course_tutorial_id", name: "tbl_course_lab_ibfk_1"
  add_foreign_key "tbl_course_section", "tbl_course", column: "course_id", primary_key: "course_id", name: "tbl_course_section_ibfk_1"
  add_foreign_key "tbl_course_tutorial", "tbl_course_section", column: "course_section_id", primary_key: "course_section_id", name: "tbl_course_tutorial_ibfk_1"
  add_foreign_key "tbl_lookup_course_completed", "tbl_course", column: "course_id", primary_key: "course_id", name: "tbl_lookup_course_completed_ibfk_2"
  add_foreign_key "tbl_lookup_course_completed", "tbl_student", column: "student_id", primary_key: "student_id", name: "tbl_lookup_course_completed_ibfk_1"
  add_foreign_key "tbl_lookup_course_prerequisites", "tbl_course", column: "course_id", primary_key: "course_id", name: "tbl_lookup_course_prerequisites_ibfk_1"
  add_foreign_key "tbl_lookup_course_prerequisites", "tbl_course", column: "course_id_prereq", primary_key: "course_id", name: "tbl_lookup_course_prerequisites_ibfk_2"
  add_foreign_key "tbl_lookup_sequence_course", "tbl_course", column: "course_id", primary_key: "course_id", name: "tbl_lookup_sequence_course_ibfk_2"
  add_foreign_key "tbl_lookup_sequence_course", "tbl_sequence", column: "sequence_id", primary_key: "sequence_id", name: "tbl_lookup_sequence_course_ibfk_1"
  add_foreign_key "tbl_student", "tbl_sequence", column: "sequence_id", primary_key: "sequence_id", name: "tbl_student_ibfk_2"
  add_foreign_key "tbl_student", "tbl_user", column: "user_id", primary_key: "user_id", name: "tbl_student_ibfk_1"
end
