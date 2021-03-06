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

ActiveRecord::Schema.define(version: 2019_05_18_075026) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "atoms", force: :cascade do |t|
    t.string "title"
    t.string "author"
    t.string "institution"
    t.string "description"
    t.string "topic1"
    t.string "lo1"
    t.string "topic2"
    t.string "lo2"
    t.string "tags"
    t.integer "difficulty"
    t.integer "time"
    t.string "item_parameter"
    t.integer "state", default: 0
    t.integer "point"
    t.string "atype"
    t.string "source_course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade do |t|
    t.string "course_name"
    t.string "course_id"
    t.string "department"
    t.string "curator"
    t.string "atoms", default: [], array: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notices", force: :cascade do |t|
    t.integer "aid"
    t.integer "cid"
    t.integer "uid"
    t.string "description"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.integer "utype"
    t.string "username"
    t.string "email"
    t.string "password"
    t.string "department"
    t.integer "course_list", default: [], array: true
    t.integer "follow_course_list", default: [], array: true
    t.integer "atom_list", default: [], array: true
    t.string "reset_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
