class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.string :opportunity_name, null: false
      t.string :account_name, null: false
      t.string :type
      t.string :amount
      t.string :stage
      t.string :owner, null: false
      t.string :probability
      t.string :contact_name
      t.string :comments
      t.datetime :closing_date
      t.timestamps
    end
  end
end
