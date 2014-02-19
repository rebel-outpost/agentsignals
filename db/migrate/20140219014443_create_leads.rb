class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :interested_in
      t.string :comments
      t.string :lead_status
      t.string :lead_source
      t.string :lead_owner, null: false
      t.string :account_name
      t.string :opportunity_name
      t.string :opportunity_owner
      t.timestamps
    end
  end
end
