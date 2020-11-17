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

ActiveRecord::Schema.define(version: 2020_11_17_012002) do

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.integer "number_of_enrolled_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "begin_year"
    t.integer "course_id"
    t.string "class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_furigana"
    t.string "first_name_furigana"
    t.integer "class_id"
    t.string "icon"
    t.text "biography"
    t.datetime "school_access_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_furigana"
    t.string "first_name_furigana"
    t.integer "gender"
    t.string "icon"
    t.string "biography"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
