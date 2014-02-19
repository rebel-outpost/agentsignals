class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task_name, null: false
      t.datetime :due_date, null: false
      t.string :assigned_to, null: false
      t.string :task_type, null: false
      t.string :lead_for_task, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
