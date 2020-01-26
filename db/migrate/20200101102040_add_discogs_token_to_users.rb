class AddDiscogsTokenToUsers < ActiveRecord::Migration[6.0]
  def change
    change_table :users, bulk: true do |t|
      t.column :discogs_token, :string, null: true
      t.column :discogs_token_status, :string, null: false
      t.column :discogs_token_status_checked_at, :datetime, null: true
    end
  end
end
