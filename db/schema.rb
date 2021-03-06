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

ActiveRecord::Schema.define(version: 20171210020538) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "cube"
  enable_extension "earthdistance"

  create_table "addresses", force: :cascade do |t|
    t.string   "kind"
    t.string   "street"
    t.string   "number"
    t.string   "complement"
    t.string   "zip_code"
    t.string   "neighborhood"
    t.string   "city"
    t.string   "state"
    t.string   "country"
    t.decimal  "lat"
    t.decimal  "lng"
    t.integer  "user_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index "ll_to_earth((lat)::double precision, (lng)::double precision)", name: "addresses_earthdistance_ix", using: :gist
    t.index ["user_id"], name: "index_addresses_on_user_id", using: :btree
  end

  create_table "game_kinds", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "games", force: :cascade do |t|
    t.string   "name",                          limit: 100
    t.string   "description",                   limit: 300
    t.datetime "launch_date"
    t.datetime "lifetime"
    t.integer  "players"
    t.integer  "user_id"
    t.integer  "game_kind_id"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.boolean  "permitted_instant_reservation"
    t.float    "price"
    t.integer  "theme_id"
    t.index ["game_kind_id"], name: "index_games_on_game_kind_id", using: :btree
    t.index ["theme_id"], name: "index_games_on_theme_id", using: :btree
    t.index ["user_id"], name: "index_games_on_user_id", using: :btree
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "game_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.index ["game_id"], name: "index_photos_on_game_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.integer  "status"
    t.integer  "game_id"
    t.integer  "user_id"
    t.datetime "start_date"
    t.datetime "end_date"
    t.float    "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_reservations_on_game_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "themes", force: :cascade do |t|
    t.string   "name",       limit: 30
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "provider",                default: "email", null: false
    t.string   "uid",                     default: "",      null: false
    t.string   "encrypted_password",      default: "",      null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",           default: 0,       null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "surname"
    t.string   "email"
    t.string   "identification_document"
    t.datetime "birth_date"
    t.string   "photo"
    t.float    "rating"
    t.string   "interests"
    t.text     "tokens"
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "contact"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true, using: :btree
  end

  create_table "wishlists", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_wishlists_on_game_id", using: :btree
    t.index ["user_id"], name: "index_wishlists_on_user_id", using: :btree
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "games", "game_kinds"
  add_foreign_key "games", "users"
  add_foreign_key "photos", "games"
  add_foreign_key "reservations", "games"
  add_foreign_key "reservations", "users"
  add_foreign_key "wishlists", "games"
  add_foreign_key "wishlists", "users"
end
