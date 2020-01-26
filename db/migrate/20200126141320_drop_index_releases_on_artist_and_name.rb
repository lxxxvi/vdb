class DropIndexReleasesOnArtistAndName < ActiveRecord::Migration[6.0]
  def change
    remove_index :releases, column: %i[artist name], unique: true
  end
end
