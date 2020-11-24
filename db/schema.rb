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

ActiveRecord::Schema.define(version: 2020_11_24_065002) do

  create_table "courses", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "school_id"
    t.string "name"
    t.integer "number_of_enrolled_year"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prefectures", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.string "name_furigana"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_companies", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "company_code"
    t.string "name"
    t.string "name_furigana"
    t.string "postal_code"
    t.integer "prefecture_id"
    t.string "address"
    t.date "found_date"
    t.string "tel_number"
    t.string "fax_number"
    t.string "stock_list"
    t.integer "number_of_employee"
    t.integer "number_of_employee_male"
    t.integer "number_of_employee_female"
    t.integer "capital"
    t.integer "proceed"
    t.text "bisiness_details"
    t.text "url"
    t.text "recruit_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_company_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_company_category_assigns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "company_category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_company_tag_assigns", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "company_id"
    t.integer "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_company_tags", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_job_categories", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_posts", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "recruit_code"
    t.integer "company_id"
    t.integer "year"
    t.integer "job_category_id"
    t.string "job_description"
    t.integer "recruitment_numbers"
    t.text "working_office"
    t.integer "status"
    t.integer "employment_status"
    t.string "employment_status_other"
    t.integer "salary_2year"
    t.integer "salary_3year"
    t.integer "salary_4year"
    t.text "apply_method"
    t.string "submit_document"
    t.text "other_description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recruit_student_company_favorites", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "student_id"
    t.integer "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "school_classes", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "begin_year"
    t.integer "course_id"
    t.string "school_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "schools", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", id: :string, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "last_name"
    t.string "first_name"
    t.string "last_name_furigana"
    t.string "first_name_furigana"
    t.integer "class_id"
    t.integer "gender"
    t.string "icon"
    t.text "biography"
    t.datetime "school_access_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teachers", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
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
