class DropIndexReleasesOnDiscogsReleaseId < ActiveRecord::Migration[6.0]
  def change
    remove_index :releases, column: %i[discogs_release_id], unique: true
  end
end
