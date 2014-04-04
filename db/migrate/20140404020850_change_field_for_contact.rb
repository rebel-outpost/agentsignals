class ChangeFieldForContact < ActiveRecord::Migration
  def change
    rename_column :contacts, :organization_id, :account_id
  end
end
