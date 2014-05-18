class AddOpportunityNameToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :opportunity_name, :string
  end
end
