class AddMaxUsersToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :max_users, :integer, default: 1, null: false
  end
end
