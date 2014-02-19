class AddIdsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :uid, :string, limit: 40
    add_column :users, :organization_id, :integer
  end
end
