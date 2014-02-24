class AddFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :lead_owner, :string
  end
end
