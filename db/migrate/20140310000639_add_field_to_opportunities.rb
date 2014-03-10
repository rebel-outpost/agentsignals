class AddFieldToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :opportunity_type, :string
    remove_column :opportunities, :type
  end
end
