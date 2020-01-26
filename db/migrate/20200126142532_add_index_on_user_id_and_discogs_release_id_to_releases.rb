class AddIndexOnUserIdAndDiscogsReleaseIdToReleases < ActiveRecord::Migration[6.0]
  def change
    add_index :releases, %i[user_id discogs_release_id], unique: true
  end
end
