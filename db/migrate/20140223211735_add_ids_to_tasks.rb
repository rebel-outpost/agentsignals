class AddIdsToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :uid, :string, limit: 40
    add_column :tasks, :organization_id, :integer
  end
end
