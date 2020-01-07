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

ActiveRecord::Schema.define(version: 2020_01_07_090732) do

  create_table "releases", force: :cascade do |t|
    t.string "catalog_number"
    t.string "label"
    t.string "artist", null: false
    t.string "name", null: false
    t.string "year"
    t.string "genre"
    t.integer "format_quantity"
    t.integer "discogs_id"
    t.integer "discogs_community_have"
    t.integer "discogs_community_want"
    t.decimal "discogs_lowest_price", precision: 10, scale: 2
    t.integer "discogs_number_for_sale"
    t.string "discogs_cover_thumb_url"
    t.string "discogs_api_resource_url"
    t.string "discogs_uri"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["artist", "name"], name: "index_releases_on_artist_and_name", unique: true
    t.index ["discogs_id"], name: "index_releases_on_discogs_id", unique: true
  end

end
