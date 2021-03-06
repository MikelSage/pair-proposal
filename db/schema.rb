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

ActiveRecord::Schema.define(version: 20170723015050) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "pairings", force: :cascade do |t|
    t.bigint "topic_id"
    t.bigint "tutor_date_id"
    t.integer "pupil_id"
    t.integer "tutor_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_pairings_on_topic_id"
    t.index ["tutor_date_id"], name: "index_pairings_on_tutor_date_id"
  end

  create_table "topics", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tutor_dates", force: :cascade do |t|
    t.datetime "date"
    t.integer "duration"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_tutor_dates_on_user_id"
  end

  create_table "user_topics", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "topic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["topic_id"], name: "index_user_topics_on_topic_id"
    t.index ["user_id"], name: "index_user_topics_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "name"
    t.text "bio", default: "Tell us about yourself!"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "pairings", "topics"
  add_foreign_key "pairings", "tutor_dates"
  add_foreign_key "tutor_dates", "users"
  add_foreign_key "user_topics", "topics"
  add_foreign_key "user_topics", "users"
end
