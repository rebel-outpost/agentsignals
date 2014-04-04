class ChangeFieldForUser < ActiveRecord::Migration
  def change
    rename_column :users, :organization_id, :account_id
  end
end
