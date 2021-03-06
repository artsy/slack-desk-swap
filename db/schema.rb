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

ActiveRecord::Schema.define(version: 20190126181000) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "round_user_preferences", force: :cascade do |t|
    t.integer "round_id"
    t.integer "user_id"
    t.jsonb   "preferences", default: {}, null: false
    t.index ["round_id"], name: "index_round_user_preferences_on_round_id", using: :btree
    t.index ["user_id"], name: "index_round_user_preferences_on_user_id", using: :btree
  end

  create_table "rounds", force: :cascade do |t|
    t.integer  "team_id"
    t.date     "start_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_rounds_on_team_id", using: :btree
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_id"
    t.string   "name"
    t.boolean  "active",       default: true
    t.string   "domain"
    t.string   "token"
    t.integer  "question_day"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "user_id"
    t.string   "user_name"
    t.string   "real_name"
    t.string   "department"
    t.string   "tz"
    t.integer  "tz_offset"
    t.string   "location"
    t.string   "setup"
    t.integer  "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_users_on_team_id", using: :btree
  end

  add_foreign_key "round_user_preferences", "rounds"
  add_foreign_key "round_user_preferences", "users"
  add_foreign_key "rounds", "teams"
  add_foreign_key "users", "teams"
end
