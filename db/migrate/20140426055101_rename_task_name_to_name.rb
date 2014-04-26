class RenameTaskNameToName < ActiveRecord::Migration
  def change
    rename_column :tasks, :task_name, :name
  end
end
