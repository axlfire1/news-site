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

ActiveRecord::Schema[7.1].define(version: 2023_12_15_030353) do
  create_table "admin_users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "names"
    t.string "last_name"
    t.string "phone"
    t.string "role"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_admin_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true
  end

  create_table "announcements", force: :cascade do |t|
    t.integer "section_id"
    t.boolean "is_enabled", default: false
    t.boolean "is_global", default: false
    t.string "customer_name"
    t.string "customer_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_announcements_on_section_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "slogan"
    t.string "title"
    t.string "subtitle"
    t.string "author"
    t.string "content"
    t.integer "sections_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sections_id"], name: "index_news_on_sections_id"
  end

  create_table "news_walls", force: :cascade do |t|
    t.string "slogan"
    t.string "title"
    t.string "subtitle"
    t.string "author"
    t.string "content"
    t.integer "section_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["section_id"], name: "index_news_walls_on_section_id"
  end

  create_table "sections", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
