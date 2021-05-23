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

ActiveRecord::Schema.define(version: 2021_05_23_193844) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "grades", force: :cascade do |t|
    t.string "name"
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_grades_on_school_id"
  end

  create_table "people", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id"
    t.bigint "school_id", null: false
    t.string "personable_type", null: false
    t.integer "personable_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_people_on_school_id"
    t.index ["user_id"], name: "index_people_on_user_id"
  end

  create_table "person_invites", force: :cascade do |t|
    t.integer "status", default: 0, null: false
    t.string "email", null: false
    t.bigint "person_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["person_id"], name: "index_person_invites_on_person_id"
  end

  create_table "schools", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["slug"], name: "index_schools_on_slug", unique: true
    t.index ["user_id"], name: "index_schools_on_user_id"
  end

  create_table "students", force: :cascade do |t|
    t.bigint "grade_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grade_id"], name: "index_students_on_grade_id"
  end

  create_table "subject_classes", force: :cascade do |t|
    t.date "start_date", null: false
    t.date "end_date", null: false
    t.bigint "subject_id", null: false
    t.bigint "grade_id", null: false
    t.bigint "teacher_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["grade_id"], name: "index_subject_classes_on_grade_id"
    t.index ["subject_id"], name: "index_subject_classes_on_subject_id"
    t.index ["teacher_id"], name: "index_subject_classes_on_teacher_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "school_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["school_id"], name: "index_subjects_on_school_id"
  end

  create_table "teachers", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name", null: false
    t.datetime "birthday", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "grades", "schools"
  add_foreign_key "people", "schools"
  add_foreign_key "people", "users"
  add_foreign_key "person_invites", "people"
  add_foreign_key "schools", "users"
  add_foreign_key "students", "grades"
  add_foreign_key "subject_classes", "grades"
  add_foreign_key "subject_classes", "subjects"
  add_foreign_key "subject_classes", "teachers"
  add_foreign_key "subjects", "schools"
end
