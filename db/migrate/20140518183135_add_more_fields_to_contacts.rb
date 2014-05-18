class AddMoreFieldsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :lead_type, :string
    add_column :contacts, :lead_status, :string
    add_column :contacts, :lead_source, :string
  end
end
