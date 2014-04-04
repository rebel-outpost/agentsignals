class ChangeFieldForOpportunity < ActiveRecord::Migration
  def change
    rename_column :opportunities, :organization_id, :account_id
  end
end
