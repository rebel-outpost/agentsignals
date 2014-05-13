class RenameTasksToEvents < ActiveRecord::Migration
  def change
    rename_table :tasks, :events
  end
end
