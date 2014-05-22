class RemoveNullValidationsFromEvents < ActiveRecord::Migration
  def change
    change_column :events, :name, :string, null: true
    change_column :events, :due_date, :datetime, null: true
    change_column :events, :assigned_to, :string, null: true
    change_column :events, :task_type, :string, null: true
    change_column :events, :lead_for_task, :string, null: true
  end
end
