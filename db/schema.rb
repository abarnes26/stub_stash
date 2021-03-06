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

ActiveRecord::Schema.define(version: 20180223065550) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "artist_users", force: :cascade do |t|
    t.bigint "artist_id"
    t.bigint "user_id"
    t.index ["artist_id"], name: "index_artist_users_on_artist_id"
    t.index ["user_id"], name: "index_artist_users_on_user_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "name"
    t.string "url"
  end

  create_table "shows", force: :cascade do |t|
    t.datetime "date"
    t.bigint "user_id"
    t.bigint "artist_id"
    t.bigint "venue_id"
    t.index ["artist_id"], name: "index_shows_on_artist_id"
    t.index ["user_id"], name: "index_shows_on_user_id"
    t.index ["venue_id"], name: "index_shows_on_venue_id"
  end

  create_table "user_venues", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "venue_id"
    t.index ["user_id"], name: "index_user_venues_on_user_id"
    t.index ["venue_id"], name: "index_user_venues_on_venue_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.integer "role", default: 0
    t.string "spotify_token"
  end

  create_table "venues", force: :cascade do |t|
    t.string "jambase_id"
    t.string "name"
    t.string "address"
    t.string "city"
    t.string "state"
    t.string "country"
    t.string "zipcode"
    t.string "url"
    t.string "latitude"
    t.string "longitude"
  end

  add_foreign_key "artist_users", "artists"
  add_foreign_key "artist_users", "users"
  add_foreign_key "shows", "artists"
  add_foreign_key "shows", "users"
  add_foreign_key "shows", "venues"
  add_foreign_key "user_venues", "users"
  add_foreign_key "user_venues", "venues"
end
