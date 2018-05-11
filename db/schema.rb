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

ActiveRecord::Schema.define(version: 20180507013606) do

  create_table "academics", force: :cascade do |t|
    t.string "name"
    t.string "account"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "activities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "name"
    t.string "course_day"
    t.string "course_time"
    t.integer "academic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "semester"
    t.index ["academic_id"], name: "index_courses_on_academic_id"
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name"
    t.string "country"
    t.string "iso2"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "scholarships", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_academics", force: :cascade do |t|
    t.integer "student_id"
    t.integer "academic_id"
    t.integer "activity_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["academic_id"], name: "index_student_academics_on_academic_id"
    t.index ["activity_id"], name: "index_student_academics_on_activity_id"
    t.index ["student_id"], name: "index_student_academics_on_student_id"
  end

  create_table "student_courses", force: :cascade do |t|
    t.integer "student_id"
    t.integer "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_student_courses_on_course_id"
    t.index ["student_id"], name: "index_student_courses_on_student_id"
  end

  create_table "student_entries", force: :cascade do |t|
    t.integer "student_id"
    t.datetime "entry"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["student_id"], name: "index_student_entries_on_student_id"
  end

  create_table "student_scholarships", force: :cascade do |t|
    t.integer "student_id"
    t.integer "scholarship_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["scholarship_id"], name: "index_student_scholarships_on_scholarship_id"
    t.index ["student_id"], name: "index_student_scholarships_on_student_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "surname_paternal"
    t.string "surname_maternal"
    t.string "account"
    t.string "email"
    t.string "institution"
    t.binary "photo", limit: 1048576
    t.string "contact_name"
    t.string "contact_tel"
    t.integer "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "scholarship_id"
    t.integer "nationality_id"
    t.string "place_of_birth"
    t.index ["nationality_id"], name: "index_students_on_nationality_id"
    t.index ["scholarship_id"], name: "index_students_on_scholarship_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "crypted_password"
    t.string "salt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
