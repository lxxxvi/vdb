class AddNotNullConstraintToUserIdOnReleases < ActiveRecord::Migration[6.0]
  def change
    change_column_null :releases, :user_id, false
  end
end
