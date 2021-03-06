class CreateReleases < ActiveRecord::Migration[6.0]
  # rubocop:disable Metrics/MethodLength
  # rubocop:disable Metrics/AbcSize
  def change
    create_table :releases do |t|
      t.references :user, foreign_key: true, index: true
      t.string :catalog_number, null: true
      t.string :label, null: true
      t.string :artist, null: false
      t.string :name, null: false
      t.string :year, null: true
      t.string :genre, null: true
      t.string :format, null: true
      t.integer :format_quantity, null: true
      t.integer :own_quantity, null: true
      t.text :notes, null: true

      t.integer :discogs_release_id, null: true
      t.integer :discogs_community_have, null: true
      t.integer :discogs_community_want, null: true
      t.decimal :discogs_lowest_price, precision: 10, scale: 2, null: true
      t.integer :discogs_number_for_sale, null: true
      t.string :discogs_cover_thumb_url, null: true
      t.string :discogs_api_resource_url, null: true
      t.string :discogs_uri, null: true

      t.index %i[artist name], unique: true
      t.index %i[discogs_release_id], unique: true

      t.timestamps
    end
  end
  # rubocop:enable Metrics/MethodLength
  # rubocop:enable Metrics/AbcSize
end
