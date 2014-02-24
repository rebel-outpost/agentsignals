class AddIdsToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :uid, :string, limit: 40
    add_column :leads, :organization_id, :integer
  end
end
