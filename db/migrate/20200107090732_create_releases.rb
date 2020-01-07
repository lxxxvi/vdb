class CreateReleases < ActiveRecord::Migration[6.0]
  def change
    create_table :releases do |t|
      t.string :catalog_number, null: true
      t.string :label, null: true
      t.string :artist, null: false
      t.string :name, null: false
      t.string :year, null: true
      t.string :genre, null: true
      t.integer :format_quantity, null: true

      t.integer :discogs_id, null: true
      t.integer :discogs_community_have, null: true
      t.integer :discogs_community_want, null: true
      t.decimal :discogs_lowest_price, precision: 10, scale: 2, null: true
      t.integer :discogs_number_for_sale, null: true
      t.string :discogs_cover_thumb_url, null: true
      t.string :discogs_api_resource_url, null: true
      t.string :discogs_uri, null: true

      t.index [:artist, :name], unique: true
      t.index [:discogs_id], unique: true

      t.timestamps
    end
  end
end
