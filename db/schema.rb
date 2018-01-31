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

ActiveRecord::Schema.define(version: 20180113191759) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bands", force: :cascade do |t|
    t.string "name"
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id"
    t.bigint "band_id"
    t.bigint "venue_id"
    t.index ["band_id"], name: "index_shows_on_band_id"
    t.index ["user_id"], name: "index_shows_on_user_id"
    t.index ["venue_id"], name: "index_shows_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "password_digest"
    t.integer "role", default: 0
  end

  create_table "venues", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "state"
  end

  add_foreign_key "shows", "bands"
  add_foreign_key "shows", "users"
  add_foreign_key "shows", "venues"
end
