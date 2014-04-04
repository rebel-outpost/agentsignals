class ChangeFieldForLead < ActiveRecord::Migration
  def change
    rename_column :leads, :organization_id, :account_id
  end
end
