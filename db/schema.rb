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

ActiveRecord::Schema.define(version: 20150318012516) do

  create_table "completed_courses_students", id: false, force: :cascade do |t|
    t.integer "course_id",  limit: 4
    t.integer "student_id", limit: 4
  end

  create_table "courses", primary_key: "course_id", force: :cascade do |t|
    t.string  "dept",        limit: 4
    t.integer "number",      limit: 4
    t.float   "credit",      limit: 53
    t.string  "name",        limit: 128
    t.text    "description", limit: 4294967295
    t.integer "sequence_id", limit: 4
  end

  add_index "courses", ["sequence_id"], name: "index_courses_on_sequence_id", using: :btree

  create_table "courses_prereqs", force: :cascade do |t|
    t.integer  "course_id",        limit: 4
    t.integer  "prereq_type_id",   limit: 4
    t.integer  "course_id_prereq", limit: 4
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "courses_registereds", force: :cascade do |t|
    t.integer  "student_id", limit: 4
    t.integer  "courses_id", limit: 4
    t.integer  "term_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "courses_sequences", id: false, force: :cascade do |t|
    t.integer "course_id",   limit: 4
    t.integer "sequence_id", limit: 4
  end

  add_index "courses_sequences", ["course_id"], name: "index_courses_sequences_on_course_id", using: :btree
  add_index "courses_sequences", ["sequence_id"], name: "index_courses_sequences_on_sequence_id", using: :btree

  create_table "laboratories", force: :cascade do |t|
    t.integer  "tutorial_id", limit: 4
    t.string   "name",        limit: 255
    t.string   "time_start",  limit: 255
    t.string   "time_end",    limit: 255
    t.string   "day",         limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "preferences", force: :cascade do |t|
    t.string "preference", limit: 255
  end

  create_table "preferences_students", id: false, force: :cascade do |t|
    t.integer "student_id",    limit: 4
    t.integer "preference_id", limit: 4
  end

  create_table "prereq_types", force: :cascade do |t|
    t.string   "prereq_type", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "sections", force: :cascade do |t|
    t.integer "course_id",   limit: 4
    t.string  "name",        limit: 255
    t.string  "time_start",  limit: 255
    t.string  "time_end",    limit: 255
    t.string  "instructor",  limit: 255
    t.string  "day_of_week", limit: 255
    t.string  "term",        limit: 255
  end

  create_table "sequences", primary_key: "sequence_id", force: :cascade do |t|
    t.string "sequence_name", limit: 128, null: false
  end

  create_table "students", primary_key: "student_id", force: :cascade do |t|
    t.string  "first_name",  limit: 64,  default: "NoName"
    t.string  "last_name",   limit: 64,  default: "NoName"
    t.integer "user_id",     limit: 4
    t.integer "sequence_id", limit: 4
    t.string  "option",      limit: 255
  end

  add_index "students", ["sequence_id"], name: "sequence_id", using: :btree
  add_index "students", ["user_id"], name: "user_id", unique: true, using: :btree

  create_table "terms", force: :cascade do |t|
    t.string   "term",       limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "tutorials", force: :cascade do |t|
    t.integer  "section_id", limit: 4
    t.string   "name",       limit: 255
    t.string   "time_start", limit: 255
    t.string   "time_end",   limit: 255
    t.string   "day",        limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", primary_key: "user_id", force: :cascade do |t|
    t.string   "username",               limit: 64
    t.string   "email",                  limit: 128
    t.datetime "user_reg_date",                                  null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.integer  "student_id",             limit: 4
    t.string   "first_name",             limit: 255
    t.string   "last_name",              limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "students", "sequences", primary_key: "sequence_id", name: "students_ibfk_2"
  add_foreign_key "students", "users", primary_key: "user_id", name: "students_ibfk_1"
end
