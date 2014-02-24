class AddIdsToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :uid, :string, limit: 40
    add_column :contacts, :organization_id, :integer
  end
end
