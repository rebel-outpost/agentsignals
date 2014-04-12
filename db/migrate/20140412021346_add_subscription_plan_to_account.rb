class AddSubscriptionPlanToAccount < ActiveRecord::Migration
  def change
    add_column :accounts, :subscription_plan, :integer, null: false
  end
end
