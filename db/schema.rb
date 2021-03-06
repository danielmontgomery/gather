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

ActiveRecord::Schema.define(version: 20150401202336) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.text     "body"
  end

  add_index "comments", ["trip_id"], name: "index_comments_on_trip_id", using: :btree
  add_index "comments", ["user_id"], name: "index_comments_on_user_id", using: :btree

  create_table "references", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "rating"
    t.text     "description"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "recipient_id_id"
  end

  add_index "references", ["user_id"], name: "index_references_on_user_id", using: :btree

  create_table "trip_users", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "trip_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "trip_users", ["trip_id"], name: "index_trip_users_on_trip_id", using: :btree
  add_index "trip_users", ["user_id"], name: "index_trip_users_on_user_id", using: :btree

  create_table "trips", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.date     "day"
    t.time     "departure_time"
    t.integer  "price"
    t.string   "duration"
    t.integer  "size"
    t.integer  "require_rating"
    t.integer  "organizer_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "meeting_point"
  end

  add_index "trips", ["organizer_id"], name: "index_trips_on_organizer_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "nickname"
    t.string   "education"
    t.string   "about"
    t.string   "occupation"
    t.string   "hometown"
    t.string   "interests"
    t.string   "past_homes"
    t.string   "past_travels"
    t.string   "future_travels"
    t.string   "travel_style"
    t.string   "location"
    t.integer  "age"
    t.boolean  "currently_traveling"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  add_foreign_key "comments", "trips"
  add_foreign_key "comments", "users"
  add_foreign_key "references", "users"
  add_foreign_key "trip_users", "trips"
  add_foreign_key "trip_users", "users"
  add_foreign_key "trips", "users", column: "organizer_id"
end
