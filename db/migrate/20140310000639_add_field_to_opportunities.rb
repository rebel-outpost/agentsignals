class AddFieldToOpportunities < ActiveRecord::Migration
  def change
    remove_column :opportunities, :opportunity_typ
    add_column :opportunities, :opportunity_type, :string
    remove_column :opportunities, :type
  end
end
