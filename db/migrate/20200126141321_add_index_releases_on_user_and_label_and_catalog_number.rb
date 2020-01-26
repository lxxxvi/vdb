class AddIndexReleasesOnUserAndLabelAndCatalogNumber < ActiveRecord::Migration[6.0]
  def change
    add_index :releases, %i[user_id label catalog_number], unique: true
  end
end
