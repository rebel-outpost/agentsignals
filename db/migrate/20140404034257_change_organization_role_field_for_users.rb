class ChangeOrganizationRoleFieldForUsers < ActiveRecord::Migration
  def change
    rename_column :users, :organization_role, :account_role
  end
end
