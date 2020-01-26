# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_01_26_142532) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "releases", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.string "catalog_number"
    t.string "label"
    t.string "artist", null: false
    t.string "name", null: false
    t.string "year"
    t.string "genre"
    t.string "format"
    t.integer "format_quantity"
    t.integer "own_quantity"
    t.text "notes"
    t.integer "discogs_release_id"
    t.integer "discogs_community_have"
    t.integer "discogs_community_want"
    t.decimal "discogs_lowest_price", precision: 10, scale: 2
    t.integer "discogs_number_for_sale"
    t.string "discogs_cover_thumb_url"
    t.string "discogs_api_resource_url"
    t.string "discogs_uri"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id", "discogs_release_id"], name: "index_releases_on_user_id_and_discogs_release_id", unique: true
    t.index ["user_id", "label", "catalog_number"], name: "index_releases_on_user_id_and_label_and_catalog_number", unique: true
    t.index ["user_id"], name: "index_releases_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "discogs_token"
    t.string "discogs_token_status", null: false
    t.datetime "discogs_token_status_checked_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "releases", "users"
end
