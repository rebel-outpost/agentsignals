class DropLeadsTable < ActiveRecord::Migration
  def change
    drop_table :leads
  end
end
