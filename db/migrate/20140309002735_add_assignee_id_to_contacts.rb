class AddAssigneeIdToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :assignee_id, :integer
  end
end
