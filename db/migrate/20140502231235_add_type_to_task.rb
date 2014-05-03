class AddTypeToTask < ActiveRecord::Migration
  def change
    add_column :tasks, :type, :string
    add_column :tasks, :ends, :datetime
  end
end
