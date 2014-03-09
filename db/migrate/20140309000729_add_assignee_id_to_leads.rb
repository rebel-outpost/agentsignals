class AddAssigneeIdToLeads < ActiveRecord::Migration
  def change
    add_column :leads, :assignee_id, :integer
  end
end
