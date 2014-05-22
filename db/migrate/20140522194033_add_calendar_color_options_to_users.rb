class AddCalendarColorOptionsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :task_color, :string, default: '#428bca'
    add_column :users, :appointment_color, :string, default: '#5cb85c'
    add_column :users, :showing_color, :string, default: '#d9534f'
  end
end
