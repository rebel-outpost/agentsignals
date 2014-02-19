class AddChangeFieldOnLeads < ActiveRecord::Migration
  def change
    remove_column :leads, :lead_owner

    add_column :leads, :lead_owner, :string
  end
end
