class AddDiscogsTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :discogs_token, :string, null: true
  end
end
