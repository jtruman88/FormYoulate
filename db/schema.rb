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

ActiveRecord::Schema.define(version: 2021_12_26_193924) do

  create_table "answers", force: :cascade do |t|
    t.string "text"
    t.integer "field_id", null: false
    t.integer "submission_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_answers_on_field_id"
    t.index ["submission_id"], name: "index_answers_on_submission_id"
  end

  create_table "field_option_answers", force: :cascade do |t|
    t.integer "field_option_id", null: false
    t.integer "answer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["answer_id"], name: "index_field_option_answers_on_answer_id"
    t.index ["field_option_id"], name: "index_field_option_answers_on_field_option_id"
  end

  create_table "field_options", force: :cascade do |t|
    t.string "name"
    t.integer "field_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_id"], name: "index_field_options_on_field_id"
  end

  create_table "field_types", force: :cascade do |t|
    t.string "name"
    t.string "view"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fields", force: :cascade do |t|
    t.string "label"
    t.integer "form_id", null: false
    t.integer "field_type_id", null: false
    t.boolean "required"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["field_type_id"], name: "index_fields_on_field_type_id"
    t.index ["form_id"], name: "index_fields_on_form_id"
  end

  create_table "forms", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_forms_on_user_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.integer "form_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "user_id", null: false
    t.index ["form_id"], name: "index_submissions_on_form_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "answers", "fields"
  add_foreign_key "answers", "submissions"
  add_foreign_key "field_option_answers", "answers"
  add_foreign_key "field_option_answers", "field_options"
  add_foreign_key "field_options", "fields"
  add_foreign_key "fields", "field_types"
  add_foreign_key "fields", "forms"
  add_foreign_key "forms", "users"
  add_foreign_key "submissions", "forms"
  add_foreign_key "submissions", "users"
end
