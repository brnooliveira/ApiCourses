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

ActiveRecord::Schema[7.0].define(version: 2022_07_20_023114) do
  create_table "courseenrollments", force: :cascade do |t|
    t.string "role"
    t.integer "user_id", null: false
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_courseenrollments_on_course_id"
    t.index ["user_id"], name: "index_courseenrollments_on_user_id"
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "courseDetails"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "testresults", force: :cascade do |t|
    t.integer "result"
    t.integer "test_id", null: false
    t.integer "grader_id", null: false
    t.integer "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["grader_id"], name: "index_testresults_on_grader_id"
    t.index ["student_id"], name: "index_testresults_on_student_id"
    t.index ["test_id"], name: "index_testresults_on_test_id"
  end

  create_table "tests", force: :cascade do |t|
    t.string "name"
    t.date "date"
    t.integer "course_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_tests_on_course_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "firstName"
    t.string "lastName"
    t.json "social"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "courseenrollments", "courses"
  add_foreign_key "courseenrollments", "users"
  add_foreign_key "testresults", "tests"
  add_foreign_key "testresults", "users", column: "grader_id"
  add_foreign_key "testresults", "users", column: "student_id"
  add_foreign_key "tests", "courses"
end
