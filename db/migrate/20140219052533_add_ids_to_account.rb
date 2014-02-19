class AddIdsToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :uid, :string, limit: 40
    add_column :accounts, :organization_id, :integer
  end
end
