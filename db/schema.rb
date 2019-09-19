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

ActiveRecord::Schema.define(version: 2019_09_19_105010) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "date"
    t.time "start_time"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "boardgames", force: :cascade do |t|
    t.string "name"
    t.integer "year_published"
    t.integer "min_players"
    t.integer "max_players"
    t.integer "min_playtime"
    t.integer "max_playtime"
    t.integer "min_age"
    t.text "description"
    t.string "desc_short"
    t.string "img_url"
    t.string "thumb_url"
    t.string "url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "bga_id"
    t.string "slug"
    t.integer "view", default: 0
    t.index ["slug"], name: "index_boardgames_on_slug", unique: true
  end

  create_table "boardgamescategories", force: :cascade do |t|
    t.bigint "boardgame_id"
    t.bigint "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boardgame_id"], name: "index_boardgamescategories_on_boardgame_id"
    t.index ["category_id"], name: "index_boardgamescategories_on_category_id"
  end

  create_table "boardgamesmechanics", force: :cascade do |t|
    t.bigint "boardgame_id"
    t.bigint "mechanic_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boardgame_id"], name: "index_boardgamesmechanics_on_boardgame_id"
    t.index ["mechanic_id"], name: "index_boardgamesmechanics_on_mechanic_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.string "bga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string "slug", null: false
    t.integer "sluggable_id", null: false
    t.string "sluggable_type", limit: 50
    t.string "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type"
    t.index ["sluggable_type", "sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_type_and_sluggable_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friends_on_friend_id"
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "images", force: :cascade do |t|
    t.string "url"
    t.string "thumb"
    t.string "bga_id"
    t.string "small"
    t.string "medium"
    t.string "large"
    t.string "original"
    t.bigint "boardgame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["boardgame_id"], name: "index_images_on_boardgame_id"
  end

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "bga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "profiles", force: :cascade do |t|
    t.string "username"
    t.string "image"
    t.text "bio"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "slug"
    t.string "city"
    t.string "country"
    t.index ["slug"], name: "index_profiles_on_slug", unique: true
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "usersboardgames", force: :cascade do |t|
    t.bigint "boardgame_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "favorite", default: false
    t.integer "play_count"
    t.index ["boardgame_id"], name: "index_usersboardgames_on_boardgame_id"
    t.index ["user_id"], name: "index_usersboardgames_on_user_id"
  end

  create_table "videos", force: :cascade do |t|
    t.string "url"
    t.string "title"
    t.string "channel_name"
    t.string "thumb_url"
    t.string "image_url"
    t.string "bga_id"
    t.bigint "boardgame_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "views"
    t.index ["boardgame_id"], name: "index_videos_on_boardgame_id"
  end

  add_foreign_key "availabilities", "users"
  add_foreign_key "boardgamescategories", "boardgames"
  add_foreign_key "boardgamescategories", "categories"
  add_foreign_key "boardgamesmechanics", "boardgames"
  add_foreign_key "boardgamesmechanics", "mechanics"
  add_foreign_key "friends", "users", column: "friend_id"
  add_foreign_key "images", "boardgames"
  add_foreign_key "profiles", "users"
  add_foreign_key "usersboardgames", "boardgames"
  add_foreign_key "usersboardgames", "users"
  add_foreign_key "videos", "boardgames"
end
