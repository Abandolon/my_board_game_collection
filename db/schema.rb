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

ActiveRecord::Schema.define(version: 2019_09_11_104402) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  create_table "mechanics", force: :cascade do |t|
    t.string "name"
    t.string "bga_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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

  add_foreign_key "boardgamescategories", "boardgames"
  add_foreign_key "boardgamescategories", "categories"
  add_foreign_key "boardgamesmechanics", "boardgames"
  add_foreign_key "boardgamesmechanics", "mechanics"
end
